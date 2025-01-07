import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paikariwala_seller/pages/auth/sign_up_page2.dart';

import '../../controllers/auth_controller..dart';
import '../../utils/colors.dart';

class SignUpPage1 extends StatefulWidget {
  SignUpPage1({Key? key}) : super(key: key);

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController nidController = TextEditingController();

  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);

    Get.find<AuthController>().nidFrontImg.value = _pickedFile!.path;
  }

  Future<void> _pickImageBack() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);

    Get.find<AuthController>().nidBackImg.value = _pickedFile!.path;

    // if (_pickedFile != null) {
    //   setState(() {
    //     _image = File(_pickedFile!.path);
    //   });
    // }
  }

  @override
  void initState() {
    Get.put(AuthController());
    super.initState();
    phoneController.text = Get.find<AuthController>().phone.value;
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
                Row(
                  children: [
                    GestureDetector(
                        onTap: (() {
                          Get.back();
                        }),
                        child: Icon(Icons.arrow_back_ios)),
                    Container(
                      child: Text(
                        "Personal Details",
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
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
                  height: 5,
                ),
                Container(
                  child: const Text(
                    "Name ",
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
                    controller: nameController,
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
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "  Please enter name ";
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
                    "NID ",
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
                    controller: nidController,
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
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "  Please enter NID ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "NID Front Image",
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
                        GestureDetector(
                          onTap: (() {
                            _pickImage();
                          }),
                          child: Container(
                              height: (Get.width - 32 - 20) / 2,
                              width: (Get.width - 32 - 20) / 2,
                              color: Colors.white,
                              child: Obx(
                                () => Get.find<AuthController>()
                                            .nidFrontImg
                                            .value ==
                                        ""
                                    ? Center(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/id-card.png")),
                                        ),
                                      )
                                    : Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                MyColors.blue.withOpacity(.3)),
                                        child: Image.file(
                                          File(Get.find<AuthController>()
                                              .nidFrontImg
                                              .value),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                        )),
                              )),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Text(
                            "NID Back Image",
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
                        GestureDetector(
                          onTap: (() {
                            _pickImageBack();
                          }),
                          child: Container(
                              height: (Get.width - 32 - 20) / 2,
                              width: (Get.width - 32 - 20) / 2,
                              color: Colors.white,
                              child: Obx(
                                () => Get.find<AuthController>()
                                            .nidBackImg
                                            .value ==
                                        ""
                                    ? Center(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/id-card.png")),
                                        ),
                                      )
                                    : Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color:
                                                MyColors.blue.withOpacity(.3)),
                                        child: Image.file(
                                          File(Get.find<AuthController>()
                                              .nidBackImg
                                              .value),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.fill,
                                        )),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (Get.find<AuthController>().nidFrontImg.value ==
                            "") {
                          Get.snackbar(" Error", "Select Front Image of NID",
                              duration: Duration(seconds: 2),
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: MyColors.blue);
                        } else if (Get.find<AuthController>()
                                .nidBackImg
                                .value ==
                            "") {
                          Get.snackbar(" Error", "Select Back Image of NID",
                              duration: Duration(seconds: 2),
                              snackPosition: SnackPosition.BOTTOM,
                              colorText: Colors.white,
                              backgroundColor: MyColors.blue);
                        } else {
                          Get.find<AuthController>().name.value =
                              nameController.text;
                          Get.find<AuthController>().nid.value =
                              nidController.text;
                          Get.find<AuthController>().phone.value =
                              phoneController.text;
                          Get.to(SignUpPage2());
                        }
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
                        "Next",
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
