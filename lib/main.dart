import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  //  Initializing Supabase


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
