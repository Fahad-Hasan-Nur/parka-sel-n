import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:paikariwala_seller/pages/auth/sign_in.dart';

import '../../controllers/auth_controller..dart';
import '../../utils/colors.dart';

class SignUpPage3 extends StatefulWidget {
  SignUpPage3({Key? key}) : super(key: key);

  @override
  _SignUpPage3State createState() => _SignUpPage3State();
}

class _SignUpPage3State extends State<SignUpPage3> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  TextEditingController accountNongController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController mfsIdController = TextEditingController();
  TextEditingController mfsNongController = TextEditingController();
  List<String> mfs = ['Bkash', 'Rocket', 'Nogod', 'Upay'];

  _createWallet(context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop();
            Get.offAll(() => SignInPage());
          });
          return Dialog(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              constraints:
                  BoxConstraints(maxHeight: Get.height, maxWidth: Get.width),
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Lottie.asset("assets/animations/reg_suc.json")),
            ),
          );
        });
  }

  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
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
          child: Scaffold(
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
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (() {
                                Get.back();
                              }),
                              child: Icon(Icons.arrow_back_ios)),
                          Container(
                            child: Text(
                              "Bank Details",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: const Text(
                          "Bank Name ",
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
                          controller: bankNameController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please enter Bank Name ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: const Text(
                          "Branch Name ",
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
                          controller: branchNameController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please enter Branch Name ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: const Text(
                          "Account Name ",
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
                          controller: accountNameController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please enter Account Name ";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: const Text(
                          "Account Number ",
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
                          controller: accountNongController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please enter Account Number";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: const Text(
                          "Mobile Bank Name ",
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
                        height: Get.height / 17.5833333333,
                        child: TextFormField(
                          readOnly: true,
                          controller: mfsIdController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                            suffixIcon: Icon(
                              Icons.expand_more,
                            ),
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please select Mobile Bank Name ";
                            }
                            return null;
                          },
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext builder) {
                                return Container(
                                  height: 4 * 50 + 60,
                                  decoration: BoxDecoration(
                                      color: MyColors.appColorLight,
                                      // borderRadius: BorderRadius.only(
                                      //   topLeft: Radius.circular(20),
                                      //   topRight: Radius.circular(20),
                                      // ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                width: Get.width,
                                                padding: const EdgeInsets.only(
                                                    left: 30),
                                                child: const Center(
                                                  child: Text(
                                                    'Select Mobile Bank',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.normal),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(height: 6),
                                          Container(
                                            height: 4 * 50 + 60,
                                            width: Get.width / 1.3,
                                            color: MyColors.appColorLight,
                                            child: ListView.builder(
                                                itemCount: 4,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return InkWell(
                                                    onTap: () {
                                                      mfsIdController.text =
                                                          mfs[index];
                                                      Get.find<AuthController>()
                                                          .mfsId
                                                          .value = '1';

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 4, bottom: 4),
                                                      height: 40,
                                                      width: Get.width,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              MyColors.appColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Center(
                                                        child: Text(
                                                          mfs[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then(
                              (dynamic value) {
                                //controller.temporaryDate = null;
                              },
                            );
                          },
                        ),
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: TextFormField(
                      //     controller: mfsIdController,
                      //     keyboardType: TextInputType.number,
                      //     inputFormatters: [
                      //       FilteringTextInputFormatter.digitsOnly
                      //     ],
                      //     cursorColor: Colors.black,
                      //     style: const TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 14,
                      //         fontStyle: FontStyle.normal),
                      //     decoration: const InputDecoration(
                      //       border: InputBorder.none,
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(8.0)),
                      //         borderSide: BorderSide(color: Colors.white),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(8.0)),
                      //         borderSide: BorderSide(color: Colors.white),
                      //       ),
                      //     ),
                      //     validator: (String? value) {
                      //       if (value!.isEmpty) {
                      //         return "  Please enter Mobile Bank ID ";
                      //       }
                      //       return null;
                      //     },
                      //   ),
                      // ),

                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        child: const Text(
                          "Mobile Bank Number  ",
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
                          controller: mfsNongController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontStyle: FontStyle.normal),
                          decoration: const InputDecoration(
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
                          ),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "  Please enter Mobile Bank Number";
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(child: Container()),
                      Container(
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Get.find<AuthController>().bName.value =
                                  bankNameController.text;
                              Get.find<AuthController>().branchName.value =
                                  branchNameController.text;
                              Get.find<AuthController>().bAccountName.value =
                                  accountNameController.text;
                              Get.find<AuthController>().bAccountNong.value =
                                  accountNongController.text;

                              Get.find<AuthController>().mfsNumner.value =
                                  mfsNongController.text;

                              Get.find<AuthController>().isLoading.value = true;

                              Get.find<AuthController>()
                                  .signUpUser()
                                  .then((value) async {
                                if (value == true) {
                                  _createWallet(context);
                                }
                              });
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
                              "Submit",
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
