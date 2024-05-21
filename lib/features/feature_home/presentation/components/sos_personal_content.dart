import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/core/utils/extensions/string_extensions.dart';
import 'package:okoa/theme/colors.dart';

import '../../../feature_track/presentation/controller/track_controller.dart';

class SosPersonal extends StatefulWidget {
  const SosPersonal({super.key});

  @override
  State<SosPersonal> createState() => _SosPersonalState();
}

class _SosPersonalState extends State<SosPersonal> {
  late final CoreController _coreController;
  late final TrackController _trackController;

  @override
  void initState() {
    super.initState();

    _coreController = Get.find<CoreController>();
    _trackController = Get.find<TrackController>();

    //  get current user's location
    ever(_trackController.currentLocation, (location) {
      if (location != null) {
        // _trackController.getAddressFromLatLng(
        //     coordinates: LatLng(_trackController.currentLocation.value!.latitude!,
        //         _trackController.currentLocation.value!.longitude!));
      }
    });

    if (_coreController.sleepTimerIsolate.value == null) {
      _coreController.setSleepTimer(
          duration: const Duration(seconds: 5),
          onCountdown: (secondsRemaining, isolate) async {
            _coreController.setSleepTimerPeriod(seconds: secondsRemaining);
            _coreController.setSleepTimerIsolate(isolate: isolate);

            if (secondsRemaining == 0) {
              _coreController.setSleepTimerIsolate(isolate: null);
            }
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hang On!', style: Theme.of(context).textTheme.titleLarge),

          const SizedBox(height: 32),

          //  countdown
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sending SOS to all partners in...',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Obx(
                        () => Text(
                            '${_coreController.sleepTimerPeriod.value.toString().parseToSeconds} s',
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .fontWeight,
                                color: sosRed),
                            textAlign: TextAlign.center),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //  cancel buttons
              TextButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.cancel_rounded, color: sosRed),
                      SizedBox(width: 8),
                      Text('CANCEL SOS')
                    ],
                  )),

              //  send now
              FilledButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.send_rounded),
                      SizedBox(width: 8),
                      Text('SEND SOS')
                    ],
                  ))
            ],
          )

          //  send message to partners
          //  call partners
          //  choose message templates to send
          //  call police
          //  call the ambulance
          //  call firefighters
        ],
      ),
    );
  }
}
