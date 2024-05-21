import 'package:okoa/core/domain/use_case/decrypt_aes.dart';
import 'package:okoa/core/domain/use_case/encrypt_aes.dart';
import 'package:okoa/core/domain/use_case/firebase/firebase_use_cases.dart';
import 'package:okoa/core/domain/use_case/get_all_users_from_db.dart';
import 'package:okoa/core/domain/use_case/get_user_data_from_db.dart';
import 'package:okoa/core/domain/use_case/listen_to_user_data_on_db.dart';
import 'package:okoa/core/domain/use_case/make_phone_call.dart';
import 'package:okoa/core/domain/use_case/send_sms.dart';
import 'package:okoa/core/domain/use_case/set_sleep_timer_use_case.dart';
import 'package:okoa/core/domain/use_case/update_user_data_on_db.dart';

import 'listen_to_internet_status.dart';

class CoreUseCases {
  final FirebaseUseCases firebaseUseCases;
  final GetAllUsersFromDB getAllUsersFromDB;
  final GetUserDataFromDB getUserDataFromDB;
  final UpdateUserDataOnDB updateUserDataOnDB;
  final ListenToUserDataOnDB listenToUserDataOnDB;
  final ListenToInternetStatus listenToInternetStatus;
  final EncryptAES encryptAES;
  final DecryptAES decryptAES;
  final MakePhoneCall makePhoneCall;
  final SendSMS sendSMS;
  final SetSleepTimerUseCase setSleepTimerUseCase;

  CoreUseCases(
      {required this.firebaseUseCases,
      required this.getAllUsersFromDB,
      required this.getUserDataFromDB,
      required this.updateUserDataOnDB,
      required this.listenToUserDataOnDB,
      required this.listenToInternetStatus,
      required this.encryptAES,
      required this.decryptAES,
      required this.makePhoneCall,
      required this.sendSMS,
      required this.setSleepTimerUseCase});
}
