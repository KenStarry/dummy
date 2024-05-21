import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okoa/core/presentation/components/open_bottom_sheet.dart';
import 'package:okoa/core/utils/extensions/string_extensions.dart';
import 'package:okoa/features/feature_auth/domain/model/message.dart';
import 'package:okoa/features/feature_home/presentation/components/chat_bottom_sheet.dart';

import '../../../../../core/presentation/components/avatar.dart';
import '../../../../../core/presentation/controller/core_controller.dart';
import '../../../../../theme/colors.dart';

class ReceivedMessageCard extends StatefulWidget {
  final Message message;

  const ReceivedMessageCard({super.key, required this.message});

  @override
  State<ReceivedMessageCard> createState() => _ReceivedMessageCardState();
}

class _ReceivedMessageCardState extends State<ReceivedMessageCard> {
  late final CoreController _coreController;

  @override
  void initState() {
    super.initState();

    _coreController = Get.find<CoreController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border(
              left:
                  BorderSide(color: Theme.of(context).primaryColor, width: 3))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Obx(() => Avatar(
                  avatarUrl: _coreController.partnerDetails.values
                      .toList()
                      .firstWhere((partner) =>
                          partner.userId == widget.message.messageSenderId)
                      .avatarUrl,
                  size: const Size(45, 45))),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        _coreController.partnerDetails.values
                            .toList()
                            .firstWhere((partner) =>
                                partner.userId ==
                                widget.message.messageSenderId)
                            .userName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    //  date sent
                    Text(
                      '${widget.message.messageSentDate.getCurrentHourIn24} : ${widget.message.messageSentDate.getCurrentMinutes}',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: Text(
                widget.message.messageText,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.clip,
              )),
              GestureDetector(
                onTap: () {
                  //  expand to show reply button
                  openBottomSheet(
                      content: const ChatBottomSheet(), onComplete: () {});
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Row(
                    children: [
                      Icon(
                        Icons.reply_rounded,
                        color: Theme.of(context).iconTheme.color!,
                      ),
                      const SizedBox(width: 8),
                      Text('Reply')
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
