import 'package:flutter/material.dart';
import 'package:okoa/core/data/api/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get/get.dart';

void main() async {
  //  Initializing Supabase
  await Supabase.initialize(url: Api.url, anonKey: Api.anonKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Text("Hello"),
      debugShowCheckedModeBanner: false,
    );
  }
}
