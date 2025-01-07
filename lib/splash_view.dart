import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paikariwala_seller/pages/auth/sign_in.dart';

import 'dashboard.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      GetStorage box = GetStorage();
      if (box.read("access_token") != null) {
        Get.offAll(MyApp());
      } else {
        Get.offAll(SignInPage());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Container(
                child: Image.asset("assets/Paikariwala.png",
                    gaplessPlayback: true, fit: BoxFit.fill),
              ),
            )));
  }
}
