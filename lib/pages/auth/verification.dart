import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../controllers/auth_controller..dart';
import '../../dashboard.dart';
import '../../utils/colors.dart';

class VerficationPage extends StatefulWidget {
  VerficationPage({Key? key}) : super(key: key);

  @override
  _VerficationPageState createState() => _VerficationPageState();
}

class _VerficationPageState extends State<VerficationPage> {
  Timer? countdownTimer;
  Duration myDuration = Duration(seconds: 60);

  TextEditingController otpController = TextEditingController();
  String email = '';
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Timer related methods ///
  // Step 3
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    _createWallet(context) {
      showDialog(
          context: context,
          builder: (BuildContext builderContext) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop();
              Get.offAll(() => MyApp());
            });
            return Dialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Container(
                decoration: BoxDecoration(
                    //  color: Colors.black,
                    borderRadius: BorderRadius.circular(15)),
                constraints:
                    BoxConstraints(maxHeight: Get.height, maxWidth: Get.width),
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Get.find<AuthController>().login == true
                        ? Lottie.asset("assets/animations/login1.json")
                        : Lottie.asset("assets/animations/regg.json")),
              ),
            );
          });
    }

    return Obx(() => Visibility(
          visible: !(Get.find<AuthController>().isLoading.value),
          replacement: Container(
            color: MyColors.white,
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Lottie.asset("assets/animations/loading.json")),
          ),
          child: Container(
            color: MyColors.white,
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30),
            child: Scaffold(
              backgroundColor: MyColors.white,
              body: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Enter Verification Code",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          "Enter the 4 digit verification code sent to your Mobile no at ${box.read("phone")} ",
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: "Change Number",
                          style: TextStyle(
                              color: MyColors.appColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //   Get.offAll(SignUpPageView());
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      controller: otpController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: false,
                      textStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,

                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 70,
                          fieldWidth: 70,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          activeColor: Colors.white,
                          borderWidth: 1,
                          selectedFillColor: Colors.white,
                          selectedColor: MyColors.blue,
                          inactiveColor: Colors.white),

                      cursorColor: Colors.white,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      // controller: controller.otpController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],

                      onChanged: (value) {
                        debugPrint(value);
                        if (value.length == 4) {
                          Get.find<AuthController>().isLoading.value = true;
                          Get.find<AuthController>().authenticate(
                            box.read("phone"),
                            value,
                          );
                          // _createWallet(context);
                          // controller.otpController.text = value;
                          // controller.onComplete();
                        }
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        return true;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                    child: Text(
                      "Code not received?",
                      style: TextStyle(
                          height: 1.5,
                          // color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Resend",
                      style: TextStyle(
                          height: 1.5,
                          color: "$minutes:$seconds" == "00:00"
                              ? MyColors.appColor
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //   Get.offAll(SignUpPageView());
                        },
                      children: [
                        TextSpan(
                          text: " again after ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //   Get.offAll(SignUpPageView());
                            },
                        ),
                        TextSpan(
                          text: "$minutes:$seconds sec",
                          style: TextStyle(
                              color: MyColors.appColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              //   Get.offAll(SignUpPageView());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
        ));
  }
}
