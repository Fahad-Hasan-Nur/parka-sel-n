import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/splash_view.dart';

class Paikariwala extends StatelessWidget {
  const Paikariwala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Paikariwala",
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Color.fromARGB(255, 235, 233, 233),
          primaryColor: Color(0xFFBFBFBF)),
      home: Scaffold(body: SplashView()),
    );
  }
}
