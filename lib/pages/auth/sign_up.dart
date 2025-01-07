import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/pages/auth/sign_in.dart';
import 'package:paikariwala_seller/pages/auth/sign_up_page1.dart';

import '../../controllers/auth_controller..dart';
import '../../utils/colors.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Container(
          color: MyColors.white,
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Let’s Sign you up",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: const Text(
                    "Phone ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextFormField(
                    controller: phoneController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontStyle: FontStyle.normal),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          )),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter Phone ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<AuthController>().phone.value =
                            phoneController.text;
                        Get.to(SignUpPage1());
                      }
                    },
                    color: MyColors.appColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      height: 48,
                      width: Get.width,
                      alignment: Alignment.center,
                      //margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 2,
                          width: Get.width / 2.7,
                          child: Image(
                            image: AssetImage(
                              "assets/Line.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          " OR ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontSize: 16),
                        ),
                        Container(
                          height: 2,
                          width: Get.width / 2.7,
                          child: Image(
                            image: AssetImage(
                              "assets/Line.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: MaterialButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   Get.find<SignInController>().isLoading.value =
                      //       true;
                      //   controller.onLoginPressed();
                      // }

                      Get.offAll(() => SignInPage());
                    },
                    color: MyColors.appColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      height: 48,
                      width: Get.width,
                      alignment: Alignment.center,
                      //margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
