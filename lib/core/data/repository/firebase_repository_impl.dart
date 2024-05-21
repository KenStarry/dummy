import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:okoa/core/domain/repository/core_repository.dart';
import 'package:okoa/di/di.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_partner_content.dart';
import 'package:okoa/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final _coreRepo = locator.get<CoreRepository>();
  final _firebaseMessaging = locator.get<FirebaseMessaging>();

  void _handleMessage(RemoteMessage? message) {
    if (message == null) return;

    navigatorKey.currentState
        ?.pushNamed(SosPartnerContent.route, arguments: message);
  }

  @override
  Future<void> initializeFCM() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    final fcmToken = await _firebaseMessaging.getToken();

    //  Perform an action when the app is opened from a terminated state
    FirebaseMessaging.instance.getInitialMessage().then(_handleMessage);
    //  Perform an action when the app is opened from a terminated state (Background)
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    //  update okoa user with FCM Token
    await _coreRepo.updateUserDataOnDB(
        data: {'fcm_token': fcmToken}, onResponse: (response) {});
  }

  @override
  Future<bool> sendNotification(
      {required String title,
      required String body,
      required String token,
      String? image}) async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('sendNotification');

    try {
      //  sending notification implementation
      final response = await callable.call(<String, dynamic>{
        'title': title,
        'body': body,
        'image': image,
        'token': token
      });

      print("----------RESULT IS : ${response.data ?? 'No Data Came back'}");

      return response.data != null;
    } catch (error) {
      throw Exception(error);
    }
  }
}
