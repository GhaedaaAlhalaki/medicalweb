import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_web/helper/binding.dart';
import 'package:medical_web/view/homeview.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences shardpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shardpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
