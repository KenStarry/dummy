import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okoa/core/utils/extensions/string_extensions.dart';
import 'package:okoa/features/feature_auth/domain/model/message.dart';
import 'package:okoa/theme/colors.dart';

import '../../../../core/presentation/components/avatar.dart';
import '../../../../core/presentation/controller/core_controller.dart';
import '../../../feature_track/presentation/controller/track_controller.dart';

class ChatMessageCard extends StatefulWidget {
  final Message message;

  const ChatMessageCard({super.key, required this.message});

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
}

class _ChatMessageCardState extends State<ChatMessageCard> {
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
    return Column(
      crossAxisAlignment: widget.message.isSender
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: widget.message.isSender
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: widget.message.isSender
              ? [
                  BubbleSpecialThree(
                    text: widget.message.messageText,
                    color: Theme.of(context).primaryColorLight,
                    textStyle: Theme.of(context).textTheme.bodyMedium!,
                    seen: true,
                    sent: true,
                    isSender: widget.message.isSender,
                  ),
                  Obx(() => Avatar(
                      avatarUrl: _coreController.okoaUser.value!.avatarUrl,
                      size: const Size(45, 45)))
                ]
              : [
                  Obx(() => Avatar(
                      avatarUrl: _coreController.partnerDetails.values
                          .toList()
                          .firstWhere((partner) =>
                              partner.userId == widget.message.messageSenderId)
                          .avatarUrl,
                      size: const Size(45, 45))),
                  BubbleSpecialThree(
                    text: widget.message.messageText,
                    color: accent,
                    textStyle: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.bodyMedium!.fontSize,
                        fontWeight:
                            Theme.of(context).textTheme.bodyMedium!.fontWeight,
                        color: Colors.black),
                    seen: false,
                    sent: false,
                    isSender: widget.message.isSender,
                  ),
                ],
        ),

        const SizedBox(height: 8),

        //  date and time recieved
        Text(
            '${widget.message.messageSentDate.getCurrentHourIn24} : ${widget.message.messageSentDate.getCurrentMinutes}',
            style: Theme.of(context).textTheme.bodySmall)
      ],
    );
  }
}
