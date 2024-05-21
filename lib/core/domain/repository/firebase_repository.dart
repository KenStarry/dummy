abstract class FirebaseRepository {
  /// Initialize FCM
  Future<void> initializeFCM();

  /// Send Notification
  Future<bool> sendNotification(
      {required String title,
      required String body,
      required String token,
      String? image});
}
