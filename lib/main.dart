import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:okoa/core/presentation/controller/core_controller.dart';
import 'package:okoa/di/controllers_di.dart';
import 'package:okoa/di/di.dart';
import 'package:okoa/features/feature_auth/presentation/auth_page.dart';
import 'package:okoa/features/feature_auth/presentation/controller/auth_controller.dart';
import 'package:okoa/features/feature_home/presentation/components/sos_partner_content.dart';
import 'package:okoa/features/feature_main/presentation/main_screen.dart';
import 'package:okoa/features/feature_settings/domain/model/sos_message.dart';
import 'package:okoa/features/feature_settings/presentation/controller/settings_controller.dart';
import 'package:okoa/firebase_options.dart';
import 'package:okoa/theme/my_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

import 'core/data/api/api.dart';
import 'core/data/isolates/timer_isolates.dart';

//  Background Message Handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("-----------BACKGROUND MESSAGE TITLE : ${message.notification?.title}");
  print("-----------BACKGROUND MESSAGE BODY : ${message.notification?.body}");
  print("-----------BACKGROUND MESSAGE DATA : ${message.data}");
}

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  //  Supabase
  await Supabase.initialize(url: Api.url, anonKey: Api.anonKey);

  //  Dependencies
  invokeDI();
  initializeControllers();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthController _authController;
  late final CoreController _coreController;
  late final SettingsController _settingsController;

  @override
  void initState() {
    super.initState();

    _authController = Get.find<AuthController>();
    _coreController = Get.find<CoreController>();
    _settingsController = Get.find<SettingsController>();

    initializePrefs();
    initializeTimerIsolate();
  }

  void initializePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    /// set default message
    _settingsController.setDefaultMessage(
        messageEnumValue: SosMessageEnum.values.firstWhere((messageValue) =>
            messageValue.name == prefs.getString('default_message')));
  }

  void initializeTimerIsolate() async {
    final receivePort = ReceivePort();
    await Isolate.spawn(trackCurrentTimeIsolate, receivePort.sendPort);

    receivePort.listen((message) {
      final currentDate = message as DateTime;

      _coreController.updateCurrentDateTime(date: currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        home: _authController.currentSession.value != null
            ? const MainScreen()
            : const AuthPage(),
        debugShowCheckedModeBanner: false,
        theme: MyTheme(accent: _coreController.sosColor.value).lightTheme,
        darkTheme: MyTheme(accent: _coreController.sosColor.value).darkTheme,
        navigatorKey: navigatorKey,
        routes: {
          SosPartnerContent.route: (context) => const SosPartnerContent()
        },
      ),
    );
  }
}
