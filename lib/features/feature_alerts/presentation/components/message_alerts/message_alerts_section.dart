import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:okoa/features/feature_alerts/presentation/components/message_alerts/received_message_card.dart';

import '../../../../../core/domain/model/sos_state.dart';
import '../../../../../core/presentation/controller/core_controller.dart';

class MessageAlertsSection extends StatefulWidget {
  const MessageAlertsSection({super.key});

  @override
  State<MessageAlertsSection> createState() => _MessageAlertsSectionState();
}

class _MessageAlertsSectionState extends State<MessageAlertsSection> {
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
      height: double.infinity,
      child: Obx(
        () {
          final receivedMessages = _coreController.okoaUser.value!.messages
              .where((message) =>
                  message.messageSenderId !=
                  _coreController.okoaUser.value!.userId);
          return Column(
            mainAxisAlignment: receivedMessages.isNotEmpty
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            crossAxisAlignment: receivedMessages.isNotEmpty
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: receivedMessages.isNotEmpty
                ? receivedMessages.map((message) {
                    final updatedMessage = message.copyWith(
                        isSender: message.messageSenderId ==
                            _coreController.okoaUser.value!.userId);
                    return ReceivedMessageCard(message: updatedMessage);
                  }).toList()
                : [
                    SvgPicture.asset(
                      'assets/images/mailbox_${_coreController.sosState.value == SosState.safe ? 'blue' : _coreController.sosState.value == SosState.warning ? 'orange' : 'red'}.svg',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 24),
                    Text("No messages yet.",
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
          );
        },
      ),
    );
  }
}
