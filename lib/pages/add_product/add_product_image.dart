import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/my_app_bar.dart';

import '../../controllers/home_controller.dart';
import '../../dashboard.dart';
import '../../utils/colors.dart';

class AddProductImagePage extends StatefulWidget {
  AddProductImagePage({Key? key}) : super(key: key);

  @override
  _AddProductImagePageState createState() => _AddProductImagePageState();
}

class _AddProductImagePageState extends State<AddProductImagePage> {
  final _formKey = GlobalKey<FormState>();
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);

    var img = await File(_pickedFile!.path);
    var decodedImage = await decodeImageFromList(img.readAsBytesSync());
    int imgWidth = decodedImage.width;
    int imgHeight = decodedImage.height;

    if (imgWidth == 500 && imgHeight == 500) {
      Get.find<ProductController>().pickedFileList.add(_pickedFile!);
    } else {
      Get.snackbar(" Error", "Image must be 500*500 Pixels",
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black);
    }

    // if (_pickedFile != null) {
    //   setState(() {
    //     _image = File(_pickedFile!.path);
    //   });
    // }
  }

  _createWallet(context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
            Get.find<HomeController>().currentIndex.value = 2;
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
                  child: Lottie.asset("assets/animations/ss.json")),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Obx((() => Visibility(
          visible: !(Get.find<ProductController>().isLoading.value),
          replacement: Container(
            color: MyColors.white,
            child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Lottie.asset("assets/animations/loading.json")),
          ),
          child: Scaffold(
            backgroundColor: MyColors.white,
            appBar: CustomAppBar(),
            body: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          child: Text(
                            "Add Product",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Upload your Product Pictures *",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 197,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: GestureDetector(
                          onTap: () => {
                            if (Get.find<ProductController>()
                                    .pickedFileList
                                    .length <
                                5)
                              {_pickImage()}
                            else
                              {
                                Get.snackbar(" Sorry",
                                    "You can not add more than 5 images",
                                    duration: Duration(seconds: 2),
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                    backgroundColor: MyColors.blue)
                              }
                          },
                          child: Center(
                              child: Container(
                            height: 78,
                            width: 78,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(78 / 2),
                              color: MyColors.appColor.withOpacity(.17),
                            ),
                            child: Icon(
                              Icons.photo_camera,
                              color: MyColors.appColor,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Not more than 5 pictures",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      Obx((() => Get.find<ProductController>()
                                  .pickedFileList
                                  .length >
                              0
                          ? Container(
                              height: 120,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Get.find<ProductController>()
                                      .pickedFileList
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: MyColors.blue,
                                          image: DecorationImage(
                                            image: FileImage(
                                              File(Get.find<ProductController>()
                                                  .pickedFileList[index]
                                                  .path),
                                            ),
                                            fit: BoxFit.fill,
                                          )),
                                      child: GestureDetector(
                                        onTap: (() {
                                          setState(() {
                                            Get.find<ProductController>()
                                                .pickedFileList
                                                .removeAt(index);
                                          });
                                        }),
                                        child: Center(
                                            child: Container(
                                          height: 30,
                                          width: 30,
                                          child: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.red,
                                          ),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                        )),
                                      ),
                                    );
                                  }),
                            )
                          : Container())),
                      Expanded(child: Container()),
                      Container(
                        // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                        child: MaterialButton(
                          onPressed: () {
                            if (Get.find<ProductController>()
                                    .pickedFileList
                                    .length >
                                0) {
                              Get.find<ProductController>().isLoading.value =
                                  true;

                              Get.find<ProductController>()
                                  .addProduct()
                                  .then((value) async {
                                if (value == true) {
                                  _createWallet(context);
                                }
                              });
                            } else {
                              Get.snackbar(
                                  " Sorry", "You need to add at least 1 image",
                                  duration: Duration(seconds: 2),
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.black);
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        )));
  }
}
