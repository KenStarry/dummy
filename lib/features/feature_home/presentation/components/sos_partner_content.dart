import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:okoa/features/feature_auth/domain/model/okoa_user.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_partner_content_card.dart';
import 'package:okoa/features/feature_track/presentation/components/track_map.dart';

class SosPartnerContent extends StatefulWidget {
  final List<OkoaUser> sosUsers;

  const SosPartnerContent({super.key, required this.sosUsers});

  @override
  State<SosPartnerContent> createState() => _SosPartnerContentState();
}

class _SosPartnerContentState extends State<SosPartnerContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('Track Partners',
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).iconTheme.color!,
            )),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: CarouselSlider(
              items: widget.sosUsers
                  .map((user) => SosPartnerContentCard(sosUser: user))
                  .toList(),
              options: CarouselOptions(
                  height: double.infinity,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  scrollPhysics: const BouncingScrollPhysics(),
                  padEnds: false,
                  onPageChanged: (index, reason) {
                    // _alertsController.setCurrentAlertSectionIndex(index: index);
                  })),
        ),
      ),
    );
  }
}
