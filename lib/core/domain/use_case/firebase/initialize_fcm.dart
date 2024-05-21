import 'package:okoa/core/data/repository/firebase_repository_impl.dart';

import '../../../../di/di.dart';
import '../../repository/firebase_repository.dart';

class InitializeFCM {
  final repo = locator.get<FirebaseRepository>();

  Future<void> call() async => await repo.initializeFCM();
}
