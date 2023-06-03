import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac/pages/home_page.dart';
import 'package:tic_tac/depenedencies/begin_bindings.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      initialBinding: BeginBindings(),
    );
  }
}
