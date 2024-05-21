import 'dart:isolate';

import 'package:okoa/core/domain/repository/core_repository.dart';

import '../../../di/di.dart';

class SetSleepTimerUseCase {
  final repository = locator.get<CoreRepository>();

  Future<void> call(
          {required Duration duration,
          required Function(int seconds, Isolate timerIsolate)
              onCountdown}) async =>
      await repository.setSleepTimer(
          duration: duration, onCountdown: onCountdown);
}
