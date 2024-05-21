import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:okoa/core/presentation/components/lottie_loader.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/features/feature_auth/domain/model/okoa_user.dart';
import 'package:okoa/features/feature_track/presentation/components/custom_user_marker.dart';
import 'package:okoa/features/feature_track/presentation/components/track_map_content.dart';
import 'package:okoa/features/feature_track/presentation/controller/track_controller.dart';
import 'package:okoa/theme/colors.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class TrackMap extends StatefulWidget {
  final bool showContent;
  final OkoaUser? sosPartner;

  const TrackMap({super.key, this.showContent = true, this.sosPartner});

  @override
  State<TrackMap> createState() => _TrackMapState();
}

class _TrackMapState extends State<TrackMap> {
  late final TrackController _trackController;
  late final CoreController _coreController;
  late final Completer<GoogleMapController> _googleMapController;

  final LatLng destination =
      const LatLng(0.28312695556758094, 34.75168063532842);

  bool isLoaded = false;
  double zoom = 18;
  double tilt = 45;
  double bearing = 0;

  @override
  void initState() {
    super.initState();

    _trackController = Get.find<TrackController>();
    _coreController = Get.find<CoreController>();
    _googleMapController = Completer<GoogleMapController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadMapStyles();
    });

    ever(_trackController.currentLocation, (location) {
      if (widget.sosPartner != null) {
        _trackController.getPolylinePoints(
            sourceLocation:
                LatLng(location?.latitude! ?? 0.0, location?.longitude! ?? 0.0),
            destination: LatLng(
              double.parse(widget.sosPartner!.latitude),
              double.parse(widget.sosPartner!.longitude),
            ));
      }
    });

    ever(_coreController.okoaUser, (user) {
      if (user != null) {
        _coreController.getPartnerDetails(partnerIds: [...user.partners]);

        final markersData = widget.sosPartner == null
            ? [
                <String, dynamic>{
                  'id': user.userId,
                  'latitude': double.parse(user.latitude),
                  'longitude': double.parse(user.longitude),
                  'widget': CustomUserMarker(avatarUrl: user.avatarUrl),
                },
              ]
            : [
                <String, dynamic>{
                  'id': user.userId,
                  'latitude': double.parse(user.latitude),
                  'longitude': double.parse(user.longitude),
                  'widget': CustomUserMarker(avatarUrl: user.avatarUrl),
                },
                <String, dynamic>{
                  'id': widget.sosPartner!.userId,
                  'latitude': double.parse(widget.sosPartner!.latitude),
                  'longitude': double.parse(widget.sosPartner!.longitude),
                  'widget':
                      CustomUserMarker(avatarUrl: widget.sosPartner!.avatarUrl),
                }
              ];

        _trackController.setMarkerData(markersData: markersData);

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await _buildMarkers(markersData: markersData);
        });
      }
    });

    ever(_trackController.currentLocation, (currentLocation) async {
      if (currentLocation != null) {
        final GoogleMapController myController =
            await _googleMapController.future;

        //  Get current zoom level
        final zoomLevel = await myController.getZoomLevel();

        await myController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                zoom: zoom,
                tilt: tilt,
                bearing: bearing,
                target: LatLng(
                    currentLocation.latitude!, currentLocation.longitude!))));
      }
    });
  }

  Future _loadMapStyles() async {
    final darkMapStyle = await rootBundle.loadString(
        'assets/json/map_styles/${Get.isDarkMode ? 'dark' : 'light'}_mode_style_3.json');

    final GoogleMapController myController = await _googleMapController.future;

    // myController.setMapStyle(darkMapStyle);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Obx(
            () {
              final currentUserLocation =
                  _trackController.currentLocation.value;
              return currentUserLocation == null
                  ? const Expanded(
                      flex: 6, child: Center(child: LottieLoader()))
                  : Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: _trackController.markerIcons.isEmpty
                            ? const UnconstrainedBox(
                                child: CircularProgressIndicator())
                            : Obx(
                                () => GoogleMap(
                                    mapType: MapType.normal,
                                    initialCameraPosition: CameraPosition(
                                        target: LatLng(
                                            currentUserLocation.latitude!,
                                            currentUserLocation.longitude!),
                                        zoom: zoom,
                                        tilt: tilt),
                                    myLocationButtonEnabled: false,
                                    myLocationEnabled: false,
                                    gestureRecognizers: <Factory<
                                        OneSequenceGestureRecognizer>>{
                                      Factory<OneSequenceGestureRecognizer>(
                                        () => EagerGestureRecognizer(),
                                      ),
                                    },
                                    onMapCreated:
                                        (GoogleMapController controller) {
                                      _googleMapController.complete(controller);
                                    },
                                    onCameraMove: (CameraPosition cameraPosition){
                                      setState(() {
                                        zoom = cameraPosition.zoom;
                                        tilt = cameraPosition.tilt;
                                        bearing = cameraPosition.bearing;
                                      });
                                    },
                                    polylines: _trackController
                                                .polylineCoordinates
                                                .isNotEmpty &&
                                            widget.sosPartner != null
                                        ? {
                                            Polyline(
                                                polylineId: PolylineId(
                                                    widget.sosPartner!.userId),
                                                color: accent,
                                                startCap: Cap.roundCap,
                                                endCap: Cap.roundCap,
                                                jointType: JointType.bevel,
                                                geodesic: true,
                                                width: 4,
                                                points: _trackController
                                                    .polylineCoordinates)
                                          }
                                        : {},
                                    markers: _trackController.markersData
                                        .map((data) => Marker(
                                            markerId: MarkerId(data['id']),
                                            icon: _trackController.markerIcons[
                                                        data['id']] ==
                                                    null
                                                ? BitmapDescriptor.defaultMarker
                                                : _trackController
                                                    .markerIcons[data['id']]!,
                                            position: LatLng(data['latitude'],
                                                data['longitude'])))
                                        .toSet()),
                              ),
                      ),
                    );
            },
          ),
          widget.showContent
              ? const Expanded(flex: 2, child: TrackMapContent())
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Future<BitmapDescriptor> getBitmapDescriptor(
          {required Widget customMarker}) async =>
      await customMarker.toBitmapDescriptor(
          waitToRender: const Duration(seconds: 10));

  Future<void> _buildMarkers(
      {required List<Map<String, dynamic>> markersData}) async {
    await Future.wait(markersData.map((data) async {
      BitmapDescriptor marker =
          await getBitmapDescriptor(customMarker: data['widget']);
      _trackController.markerIcons[data['id']] = marker;
    }));
  }
}
