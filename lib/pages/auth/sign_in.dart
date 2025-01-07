import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:paikariwala_seller/pages/auth/sign_up.dart';

import '../../controllers/auth_controller..dart';
import '../../dashboard.dart';
import '../../utils/colors.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  final box = GetStorage();
  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
    print(Get.height);
    print(Get.width);
  }

  @override
  Widget build(BuildContext context) {
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Let’s Sign you in",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: const Text(
                          "Mobile Number",
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
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
                            //    prefixText: "+880 | ",
                            //   prefixIcon: ImageIcon(AssetImage("assets/bdflag.jpeg")),
                            prefixStyle: TextStyle(color: Color(0xFFA6A8AD)),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter Phone number ";
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
                              Get.find<AuthController>().isLoading.value = true;
                              Get.find<AuthController>().phone.value =
                                  emailController.text;
                              Get.find<AuthController>()
                                  .loginUser(emailController.text);
                            }
                            //  Get.find<AuthController>().login.value = true;
                            // Get.to(() => VerficationPage());
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

                            Get.offAll(() => SignUpPage());
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
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
