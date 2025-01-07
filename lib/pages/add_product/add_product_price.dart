import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/my_app_bar.dart';
import 'package:paikariwala_seller/pages/add_product/add_product_image.dart';

import '../../utils/colors.dart';

class AddProductPricePage extends StatefulWidget {
  AddProductPricePage({Key? key}) : super(key: key);

  @override
  _AddProductPricePageState createState() => _AddProductPricePageState();
}

class _AddProductPricePageState extends State<AddProductPricePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController costPriceController = TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Product Price Details",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: const Text(
                    "Product Cost Price *",
                    style: TextStyle(
                      color: MyColors.ash,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    controller: costPriceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        return " Please enter Cost Price ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: const Text(
                    "Product Sale Price *",
                    style: TextStyle(
                      color: MyColors.ash,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    controller: salePriceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        return " Please enter Sale Price ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: const Text(
                    "Product Discount *",
                    style: TextStyle(
                      color: MyColors.ash,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    controller: discountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                        return " Please enter Discount ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Container(
                //   child: const Text(
                //     "Want to add discount?",
                //     style: TextStyle(
                //       color: MyColors.ash,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       fontStyle: FontStyle.normal,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   child: Row(
                //     children: [
                //       GestureDetector(
                //         onTap: (() {
                //           setState(() {
                //             selected = "yes";
                //           });
                //         }),
                //         child: Row(
                //           children: [
                //             selected == "yes"
                //                 ? Icon(
                //                     Icons.radio_button_checked,
                //                     color: MyColors.blue,
                //                   )
                //                 : Icon(
                //                     Icons.radio_button_unchecked,
                //                     // color: MyColors.blue,
                //                   ),
                //             Text(
                //               "Yes",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w400,
                //                 fontStyle: FontStyle.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       GestureDetector(
                //         onTap: (() {
                //           print("no");

                //           setState(() {
                //             selected = "no";
                //           });
                //         }),
                //         child: Row(
                //           children: [
                //             selected == "no"
                //                 ? Icon(
                //                     Icons.radio_button_checked,
                //                     color: MyColors.blue,
                //                   )
                //                 : Icon(
                //                     Icons.radio_button_unchecked,
                //                     // color: MyColors.blue,
                //                   ),
                //             Text(
                //               "No",
                //               style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w400,
                //                 fontStyle: FontStyle.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   child: const Text(
                //     "Commission",
                //     style: TextStyle(
                //       color: MyColors.ash,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       fontStyle: FontStyle.normal,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(5)),
                //   height: Get.height / 17.5833333333,
                //   child: TextFormField(
                //     // controller: controller.emailController,
                //     keyboardType: TextInputType.text,
                //     cursorColor: Colors.black,
                //     style: const TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 14,
                //         fontStyle: FontStyle.normal),
                //     decoration: const InputDecoration(
                //       border: InputBorder.none,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //           borderSide: BorderSide(
                //             width: 1,
                //             color: Colors.red,
                //           )),
                //       focusedErrorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(
                //           width: 1,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ),
                //     validator: (String? value) {
                //       if (value!.isEmpty) {
                //         return "Please enter Email ";
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   child: const Text(
                //     "Profit",
                //     style: TextStyle(
                //       color: MyColors.ash,
                //       fontSize: 14,
                //       fontWeight: FontWeight.w400,
                //       fontStyle: FontStyle.normal,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Container(
                //   decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(5)),
                //   height: Get.height / 17.5833333333,
                //   child: TextFormField(
                //     // controller: controller.emailController,
                //     keyboardType: TextInputType.text,
                //     cursorColor: Colors.black,
                //     style: const TextStyle(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 14,
                //         fontStyle: FontStyle.normal),
                //     decoration: const InputDecoration(
                //       border: InputBorder.none,
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       errorBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //           borderSide: BorderSide(
                //             width: 1,
                //             color: Colors.red,
                //           )),
                //       focusedErrorBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //         borderSide: BorderSide(
                //           width: 1,
                //           color: Colors.red,
                //         ),
                //       ),
                //     ),
                //     validator: (String? value) {
                //       if (value!.isEmpty) {
                //         return "Please enter Email ";
                //       }
                //       return null;
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),

                Expanded(child: Container()),
                Container(
                  // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.find<ProductController>().pCostPrice.value =
                            costPriceController.text;
                        Get.find<ProductController>().pSalePrice.value =
                            salePriceController.text;
                        Get.find<ProductController>().pDiscount.value =
                            discountController.text;
                        Get.to(() => AddProductImagePage());
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
