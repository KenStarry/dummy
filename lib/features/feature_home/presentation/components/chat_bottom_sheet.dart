import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/presentation/controller/core_controller.dart';
import '../../../../theme/colors.dart';
import '../../../feature_auth/domain/model/message.dart';
import '../../../feature_auth/domain/model/okoa_user.dart';
import '../../../feature_track/presentation/controller/track_controller.dart';
import 'chat_message_card.dart';

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({super.key});

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  late final CoreController _coreController;
  late final TrackController _trackController;

  @override
  void initState() {
    super.initState();

    _coreController = Get.find<CoreController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Partner Chat', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children:
                      _coreController.okoaUser.value!.messages.map((message) {
                    final updatedMessage = message.copyWith(
                        isSender: message.messageSenderId ==
                            _coreController.okoaUser.value!.userId);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ChatMessageCard(message: updatedMessage),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: MessageBar(
              messageBarColor: Theme.of(context).scaffoldBackgroundColor,
              replyWidgetColor: Theme.of(context).primaryColorLight,
              sendButtonColor: accent,
              onSend: (message) async {
                //  upload message to DB
                final userMessages = [
                  ..._coreController.okoaUser.value!.messages
                ];

                final messageId = DateTime.now().toString();

                final newMessage = Message(
                    messageId: messageId,
                    messageSenderId: _coreController.okoaUser.value!.userId,
                    messageText: message,
                    messageSentDate: DateTime.now().toString(),
                    isSender: true,
                    isSafeAnnouncement: false,
                    receiverIds: _coreController.partnerDetails.values
                        .map((partner) => partner.userId)
                        .toList());

                if (!userMessages
                    .map((message) => message.messageId)
                    .contains(messageId)) {
                  userMessages.add(newMessage);
                }

                //  update messages on partners
                for (OkoaUser partner
                    in _coreController.partnerDetails.values.toList()) {
                  final partnerMessages = [...partner.messages];

                  if (!partnerMessages
                      .map((message) => message.messageId)
                      .contains(messageId)) {
                    partnerMessages.add(newMessage);
                  }

                  //  send notifications to all partners
                  await _coreController.sendNotification(
                      title:
                          'Group Message from ${_coreController.okoaUser.value!.userName}',
                      body: message,
                      token: partner.fcmToken);

                  //  update each partners messages
                  await _coreController.updateUserDataOnDB(
                      uid: partner.userId,
                      data: {'messages': partnerMessages},
                      onResponse: (response) {});
                }

                //  update the messages value in DB
                await _coreController.updateUserDataOnDB(
                    data: {'messages': userMessages},
                    onResponse: (response) {});
              },
            ),
          )
        ],
      ),
    );
  }
}
