import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:okoa/core/domain/model/response_state.dart';
import 'package:okoa/core/domain/model/sos.dart';
import 'package:okoa/core/domain/model/sos_state.dart';
import 'package:okoa/core/presentation/components/open_bottom_sheet.dart';
import 'package:okoa/features/feature_home/presentation/components/home_appbar.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_partner_content.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_personal_content.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_quick_actions.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_safe_content.dart';
import 'package:okoa/features/feature_home/presentation/utils/home_constants.dart';
import 'package:okoa/features/feature_track/presentation/controller/track_controller.dart';
import 'package:okoa/theme/colors.dart';

import '../../../../core/presentation/controller/core_controller.dart';

class SOSStatusSection extends StatefulWidget {
  const SOSStatusSection({super.key});

  @override
  State<SOSStatusSection> createState() => _SOSStatusSectionState();
}

class _SOSStatusSectionState extends State<SOSStatusSection> {
  late final CoreController _coreController;
  late final TrackController _trackController;

  @override
  void initState() {
    super.initState();

    _coreController = Get.find<CoreController>();
    _trackController = Get.find<TrackController>();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 460,
        padding: const EdgeInsets.only(top: 50, bottom: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
            color: Theme.of(context).scaffoldBackgroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //  home appbar
            const HomeAppBar(),

            //  shield
            AvatarGlow(
              glowShape: BoxShape.circle,
              glowCount: 2,
              glowRadiusFactor: 0.3,
              glowColor: Theme.of(context).primaryColor,
              child: GestureDetector(
                onTap: () {
                  _coreController.okoaUser.value!.sos.sosState ==
                          SosState.sos.toString()
                      ? openBottomSheet(
                          content: const SosPersonal(), onComplete: () {})
                      : _coreController.partnerSosStates
                              .contains(SosState.sos.toString())
                          ? Get.to(() => SosPartnerContent(
                                sosUsers: _coreController.partnerDetails.values
                                    .where((user) =>
                                        user.sos.sosState ==
                                            SosState.sos.toString() &&
                                        user.userId !=
                                            _coreController
                                                .okoaUser.value!.userId)
                                    .toList(),
                              ))
                          : openBottomSheet(
                              content: const SosSafeContent(),
                              onComplete: () {});
                },
                onLongPress: () async {
                  await _trackController.getAddressFromLatLng(
                      coordinates: LatLng(
                          _trackController.currentLocation.value!.latitude!,
                          _trackController.currentLocation.value!.longitude!));

                  final updatedSOS = SOS(
                      sosState: SosState.sos.toString(),
                      sosDate: DateTime.now().toString(),
                      sosAddress:
                          _trackController.currentUserAddress.value ?? '');

                  //  change SOS Status to sos
                  await _coreController.updateUserDataOnDB(data: {
                    'sos': updatedSOS,
                  }, onResponse: (state) {}).then((value) {
                    //  open SOS bottomsheet
                    openBottomSheet(
                        content: const SosPersonal(), onComplete: () {});
                  });
                },
                child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              spreadRadius: 5)
                        ]),
                    child: Stack(
                      children: [
                        //  logo to represent current status
                        Center(
                          child: Icon(
                              _coreController.sosState.value == SosState.safe
                                  ? Icons.gpp_good_rounded
                                  : _coreController.sosState.value ==
                                          SosState.warning
                                      ? Icons.gpp_maybe_rounded
                                      : Icons.gpp_bad_rounded,
                              size: 120,
                              color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),

            //  quick actions
            Container(
              width: double.infinity,
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.transparent,
              child: Wrap(
                runSpacing: 24,
                spacing: 24,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                children: sosCategories
                    .map((category) => SosQuickActions(
                          title: category.title,
                          iconData: category.iconData,
                          onTap: () {},
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
