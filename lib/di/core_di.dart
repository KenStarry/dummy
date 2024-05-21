import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:okoa/core/data/repository/core_repository_impl.dart';
import 'package:okoa/core/domain/repository/core_repository.dart';
import 'package:okoa/core/domain/repository/firebase_repository.dart';
import 'package:okoa/core/domain/use_case/core_use_cases.dart';
import 'package:okoa/core/domain/use_case/decrypt_aes.dart';
import 'package:okoa/core/domain/use_case/encrypt_aes.dart';
import 'package:okoa/core/domain/use_case/firebase/firebase_use_cases.dart';
import 'package:okoa/core/domain/use_case/firebase/initialize_fcm.dart';
import 'package:okoa/core/domain/use_case/firebase/send_notification.dart';
import 'package:okoa/core/domain/use_case/get_all_users_from_db.dart';
import 'package:okoa/core/domain/use_case/get_user_data_from_db.dart';
import 'package:okoa/core/domain/use_case/listen_to_internet_status.dart';
import 'package:okoa/core/domain/use_case/listen_to_user_data_on_db.dart';
import 'package:okoa/core/domain/use_case/make_phone_call.dart';
import 'package:okoa/core/domain/use_case/send_sms.dart';
import 'package:okoa/core/domain/use_case/set_sleep_timer_use_case.dart';
import 'package:okoa/core/domain/use_case/update_user_data_on_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/data/repository/firebase_repository_impl.dart';

void coreDI({required GetIt locator}) {
  /// Firebase Messaging
  locator.registerLazySingleton<FirebaseMessaging>(
      () => FirebaseMessaging.instance);

  /// Supabase Client
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  /// Core Repository
  locator.registerLazySingleton<CoreRepository>(() => CoreRepositoryimpl());

  /// Firebase Repository
  locator.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl());

  /// Core Use Cases
  locator.registerLazySingleton<CoreUseCases>(() => CoreUseCases(
      firebaseUseCases: FirebaseUseCases(
          initializeFCM: InitializeFCM(), sendNotification: SendNotification()),
      getAllUsersFromDB: GetAllUsersFromDB(),
      getUserDataFromDB: GetUserDataFromDB(),
      updateUserDataOnDB: UpdateUserDataOnDB(),
      listenToUserDataOnDB: ListenToUserDataOnDB(),
      listenToInternetStatus: ListenToInternetStatus(),
      encryptAES: EncryptAES(),
      decryptAES: DecryptAES(),
      makePhoneCall: MakePhoneCall(),
      sendSMS: SendSMS(),
      setSleepTimerUseCase: SetSleepTimerUseCase()));
}
