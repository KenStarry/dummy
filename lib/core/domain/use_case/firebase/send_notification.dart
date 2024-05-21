import 'package:okoa/core/data/repository/firebase_repository_impl.dart';

import '../../../../di/di.dart';
import '../../repository/firebase_repository.dart';

class SendNotification {
  final repo = locator.get<FirebaseRepository>();

  Future<bool> call(
          {required String title,
          required String body,
          required String token,
          String? image}) async =>
      await repo.sendNotification(
          title: title, body: body, token: token, image: image);
}
