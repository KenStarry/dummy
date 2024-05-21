import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/core/utils/extensions/string_extensions.dart';
import 'package:okoa/features/feature_auth/domain/model/message.dart';
import 'package:okoa/features/feature_auth/domain/model/okoa_user.dart';
import 'package:okoa/features/feature_home/presentation/components/chat_message_card.dart';
import 'package:okoa/theme/colors.dart';

import '../../../../core/domain/model/sos.dart';
import '../../../../core/domain/model/sos_state.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        height: (_coreController.sleepTimerPeriod.value == 0 ||
                    _coreController.sleepTimerPeriod.value == 30) &&
                _coreController.okoaUser.value!.sos.sosState ==
                    SosState.sos.toString()
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                      (_coreController.sleepTimerPeriod.value == 0 ||
                                  _coreController.sleepTimerPeriod.value ==
                                      30) &&
                              _coreController.okoaUser.value!.sos.sosState ==
                                  SosState.sos.toString()
                          ? 'SOS Sent To Partners!'
                          : 'Hang On!',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const SizedBox(height: 8),
                UnconstrainedBox(
                  child: FilledButton(
                      onPressed: () async {
                        final updatedSOS = SOS(
                            sosState: SosState.safe.toString(),
                            sosDate: DateTime.now().toString(),
                            sosAddress:
                                _trackController.currentUserAddress.value ??
                                    '');

                        final messageId = DateTime.now().toString();

                        //  send all partners the message that you are safe to stop the searches
                        final newMessage = Message(
                            messageId: messageId,
                            messageSenderId:
                                _coreController.okoaUser.value!.userId,
                            messageText: "I'm safe now. Thank you :)",
                            messageSentDate: DateTime.now().toString(),
                            isSender: true,
                            isSafeAnnouncement: true,
                            receiverIds: _coreController.partnerDetails.values
                                .map((partner) => partner.userId)
                                .toList());

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
                                  '${_coreController.okoaUser.value!.userName} is Okay!',
                              body:
                                  '${_coreController.okoaUser.value!.userName} '
                                  'has declared that (s)he is doing ok. '
                                  'Reach out to find out more!',
                              token: partner.fcmToken);

                          //  update each partners messages
                          await _coreController.updateUserDataOnDB(
                              uid: partner.userId,
                              data: {'messages': partnerMessages},
                              onResponse: (response) {});
                        }

                        //  change SOS Status to sos
                        await _coreController.updateUserDataOnDB(data: {
                          'sos': updatedSOS,
                        }, onResponse: (state) {}).then((value) => Get.back());
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.send_rounded),
                          SizedBox(width: 8),
                          Text("I'M SAFE, CANCEL SOS")
                        ],
                      )),
                )
              ],
            ),

            const SizedBox(height: 32),

            // countdown
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Obx(
                  () => ((_coreController.sleepTimerPeriod.value == 0 ||
                                  _coreController.sleepTimerPeriod.value ==
                                      30) &&
                              _coreController.okoaUser.value!.sos.sosState ==
                                  SosState.sos.toString()) &&
                          _coreController.okoaUser.value!.messages.isNotEmpty
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: _coreController.okoaUser.value!.messages
                                .map((message) {
                              final updatedMessage = message.copyWith(
                                  isSender: message.messageSenderId ==
                                      _coreController.okoaUser.value!.userId);
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: ChatMessageCard(message: updatedMessage),
                              );
                            }).toList(),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: ((_coreController.sleepTimerPeriod.value ==
                                              0 ||
                                          _coreController
                                                  .sleepTimerPeriod.value ==
                                              30) &&
                                      _coreController
                                              .okoaUser.value!.sos.sosState ==
                                          SosState.sos.toString()) &&
                                  _coreController
                                      .okoaUser.value!.messages.isEmpty
                              ? [
                                  Text(
                                    'Notify Partners',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 32),
                                  SvgPicture.asset(
                                    'assets/images/chatting.svg',
                                    width: 200,
                                    height: 200,
                                  ),
                                  const SizedBox(height: 32),
                                  Text(
                                    'Text them to hurry up, call you etc.',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                ]
                              : [
                                  Text(
                                    'Sending SOS to all partners in...',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
                        ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            Obx(
              () => (_coreController.sleepTimerPeriod.value == 0 ||
                          _coreController.sleepTimerPeriod.value == 30) &&
                      _coreController.okoaUser.value!.sos.sosState ==
                          SosState.sos.toString()
                  ? Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: MessageBar(
                        messageBarColor:
                            Theme.of(context).scaffoldBackgroundColor,
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
                              messageSenderId:
                                  _coreController.okoaUser.value!.userId,
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
                          for (OkoaUser partner in _coreController
                              .partnerDetails.values
                              .toList()) {
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
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //  cancel buttons
                        TextButton(
                            onPressed: () async {
                              _coreController.setSleepTimerPeriod(seconds: 30);

                              if (_coreController.sleepTimerIsolate.value !=
                                  null) {
                                _coreController.sleepTimerIsolate.value!
                                    .kill(priority: 1);
                              }
                              _coreController.setSleepTimerIsolate(
                                  isolate: null);

                              //  return state to safe and go back
                              final updatedSOS = SOS(
                                  sosState: SosState.safe.toString(),
                                  sosDate: DateTime.now().toString(),
                                  sosAddress: _trackController
                                          .currentUserAddress.value ??
                                      '');

                              //  change SOS Status to sos
                              await _coreController.updateUserDataOnDB(data: {
                                'sos': updatedSOS,
                              }, onResponse: (state) {}).then(
                                  (value) => Get.back());
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.cancel_rounded, color: sosRed),
                                SizedBox(width: 8),
                                Text('CANCEL SOS')
                              ],
                            )),

                        //  send now
                        FilledButton(
                            onPressed: () {
                              _coreController.setSleepTimerPeriod(seconds: 0);

                              if (_coreController.sleepTimerIsolate.value !=
                                  null) {
                                _coreController.sleepTimerIsolate.value!
                                    .kill(priority: 1);
                              }
                              _coreController.setSleepTimerIsolate(
                                  isolate: null);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.send_rounded),
                                SizedBox(width: 8),
                                Text('SEND NOW')
                              ],
                            ))
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
