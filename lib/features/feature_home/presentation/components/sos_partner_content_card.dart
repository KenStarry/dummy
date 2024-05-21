import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/features/feature_auth/domain/model/okoa_user.dart';
import 'package:okoa/features/feature_home/presentation/components/map_mode_card.dart';
import 'package:okoa/features/feature_track/presentation/components/track_map.dart';
import 'package:okoa/features/feature_track/presentation/controller/track_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class SosPartnerContentCard extends StatefulWidget {
  final OkoaUser sosUser;

  const SosPartnerContentCard({super.key, required this.sosUser});

  @override
  State<SosPartnerContentCard> createState() => _SosPartnerContentCardState();
}

class _SosPartnerContentCardState extends State<SosPartnerContentCard> {
  late final CoreController _coreController;
  late final TrackController _trackController;
  final List<Map<String, dynamic>> mapModes = [
    {
      "title": "Driving",
      "asset": "assets/images/car.svg",
      'mode': TravelMode.driving
    },
    {
      "title": "Walking",
      "asset": "assets/images/walking.svg",
      'mode': TravelMode.walking
    },
    {
      "title": "Cycling",
      "asset": "assets/images/bicycle.svg",
      'mode': TravelMode.bicycling
    },
  ];

  @override
  void initState() {
    super.initState();

    _coreController = Get.find<CoreController>();
    _trackController = Get.find<TrackController>();

    ever(_trackController.currentLocation, (location) {
      //  calculate distance
      final distanceInMetres = Geolocator.distanceBetween(
          location!.latitude!,
          location.longitude!,
          double.parse(widget.sosUser.latitude),
          double.parse(widget.sosUser.longitude));

      _trackController.setDistanceBetweenPartners(
          distanceInMetres: distanceInMetres.toPrecision(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: UnconstrainedBox(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Theme.of(context).primaryColorLight),
                child: Row(
                  children: [
                    Icon(Icons.social_distance_rounded,
                        color: Theme.of(context).iconTheme.color!),
                    const SizedBox(width: 8),
                    Obx(
                      () => Text(
                          _trackController.distanceBetweenPartners.value >
                                  1000.0
                              ? '${(_trackController.distanceBetweenPartners.value / 1000).toPrecision(3)}Km away'
                              : '${_trackController.distanceBetweenPartners.value}m away',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          //  map
          Expanded(
              child: TrackMap(
            showContent: false,
            sosPartner: widget.sosUser,
          )),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //  title
              Text("${widget.sosUser.userName} sent SOS",
                  style: Theme.of(context).textTheme.titleMedium),

              //  how many minutes ago
              Row(
                children: [
                  Icon(Icons.timelapse_rounded,
                      color: Theme.of(context).iconTheme.color!),
                  const SizedBox(width: 8),
                  Obx(() => Text(
                      timeago.format(_coreController.currentDateTime.value
                          .subtract(Duration(
                              minutes:
                                  DateTime.parse(widget.sosUser.sos.sosDate)
                                      .minute))),
                      style: Theme.of(context).textTheme.bodyMedium))
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: mapModes
                  .map((mode) => Obx(
                        () => MapModeCard(
                            assetImage: mode['asset'],
                            title: mode['title'],
                            active: _trackController.travelMode.value ==
                                mode['mode'],
                            onTap: () {
                              _trackController.setTravelMode(
                                  travelMode: mode['mode']);
                            }),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
