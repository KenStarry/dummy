import 'package:okoa/core/domain/use_case/firebase/initialize_fcm.dart';
import 'package:okoa/core/domain/use_case/firebase/send_notification.dart';

class FirebaseUseCases {
  final InitializeFCM initializeFCM;
  final SendNotification sendNotification;

  const FirebaseUseCases(
      {required this.initializeFCM, required this.sendNotification});
}
