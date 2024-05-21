import 'package:encrypt/encrypt.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/di/di.dart';
import 'package:okoa/features/feature_track/domain/use_case/track_use_case.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

import '../../../../core/data/api/api.dart';

class TrackController extends GetxController {
  final coreController = Get.find<CoreController>();
  final useCase = locator.get<TrackUseCase>();

  final locationPermissionStatus =
      permission_handler.PermissionStatus.denied.obs;

  final currentLocation = Rxn<LocationData>();
  final currentUserAddress = Rxn<String>();
  final distanceBetweenPartners = 0.0.obs;
  final travelMode = TravelMode.driving.obs;

  final polylineCoordinates = <LatLng>[].obs;
  final markerIcons = <String, BitmapDescriptor>{}.obs;
  final markersData = <Map<String, dynamic>>[].obs;

  final encrypter = Rxn<Encrypter>();

  @override
  void onInit() {
    super.onInit();

    checkLocationPermissionStatus();
    requestLocationService();

    ever(coreController.okoaUser, (user) {
      if (user != null) {
        encrypter.value =
            Encrypter(AES(Key.fromUtf8(user.userId.substring(0, 32))));
      }
    });

    listenToCurrentLocation(onLocationChanged: (locationData) async {
      currentLocation.value = locationData;

      //  update latitude and longitude in core controller
      await coreController.updateUserDataOnDB(data: {
        'latitude': locationData.latitude.toString(),
        'longitude': locationData.longitude.toString(),
      }, onResponse: (state) {});
    });
  }

  void setTravelMode({required TravelMode travelMode}) =>
      this.travelMode.value = travelMode;

  void setDistanceBetweenPartners({required double distanceInMetres}) =>
      distanceBetweenPartners.value = distanceInMetres;

  void checkLocationPermissionStatus() async => locationPermissionStatus.value =
      await permission_handler.Permission.location.status;

  void requestLocationPermission() async {
    final status = await permission_handler.Permission.location.request();

    locationPermissionStatus.value = status;
  }

  /// Location Service
  void requestLocationService() async => await useCase.requestLocationService();

  /// Listen to current location
  void listenToCurrentLocation(
          {required Function(LocationData locationData) onLocationChanged}) =>
      useCase.listenToCurrentLocation
          .call(onLocationChanged: onLocationChanged);

  /// Get Current Address
  Future<void> getAddressFromLatLng(
      {required LatLng coordinates, bool updateSOS = false}) async {
    final address =
        await useCase.getAddressFromLatLng.call(coordinates: coordinates);
    currentUserAddress.value = address;
  }

  /// Get Polyline points and coordinates
  void getPolylinePoints(
      {required LatLng sourceLocation, required LatLng destination}) async {
    PolylinePoints polylinePoints = PolylinePoints();
    final coordinates = <LatLng>[].obs;

    PolylineResult polylineResult =
        await polylinePoints.getRouteBetweenCoordinates(
            Api.googleApiKey,
            PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
            PointLatLng(destination.latitude, destination.longitude),
            travelMode: travelMode.value);

    if (polylineResult.points.isNotEmpty) {
      for (PointLatLng point in polylineResult.points) {
        coordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    polylineCoordinates.value = coordinates;
  }

  void setMarkerIcons({required Map<String, BitmapDescriptor> markerIcons}) =>
      this.markerIcons.value = markerIcons;

  void setMarkerData({required List<Map<String, dynamic>> markersData}) =>
      this.markersData.value = markersData;
}
