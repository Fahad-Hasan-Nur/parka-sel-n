import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/my_app_bar.dart';
import 'package:paikariwala_seller/pages/add_product/add_product_price.dart';

import '../../utils/colors.dart';

class CreateDiscountPage extends StatefulWidget {
  CreateDiscountPage({Key? key}) : super(key: key);

  @override
  _CreateDiscountPageState createState() => _CreateDiscountPageState();
}

const List<String> data = ["Data 1", "Data 2", "Data 3", "Data 4", "Data 5"];

class _CreateDiscountPageState extends State<CreateDiscountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController mediumController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  DateTime? temporaryDate, eventDate;

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
                      "Create Discount",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    readOnly: true,
                    controller: dateOfBirthController,
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
                      suffixIcon: Icon(
                        Icons.calendar_month,
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
                      hintText: "Discount Date Range",
                      hintStyle: TextStyle(
                        color: MyColors.ash,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter Email ";
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
                            height: 320,
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: const Text(
                                            'Discount Date Range',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (temporaryDate != null) {
                                              eventDate = temporaryDate;
                                            }
                                            dateOfBirthController.text =
                                                eventDate!
                                                    .toString()
                                                    .substring(0, 10);
                                            // checkHasDataChanged();
                                            Navigator.of(context).pop();
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                right: 30),
                                            child: const Text(
                                              'Confirm',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: 6),
                                    Container(
                                      height: 300,
                                      color: MyColors.blue.withOpacity(.3),
                                      child: CupertinoDatePicker(
                                        backgroundColor: MyColors.blue,
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: eventDate,
                                        onDateTimeChanged: (DateTime date) {
                                          temporaryDate = date;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ).then(
                        (dynamic value) {
                          temporaryDate = null;
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    readOnly: true,
                    controller: mediumController,
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
                      suffixIcon: Icon(
                        Icons.expand_more,
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
                      hintText: "Product",
                      hintStyle: TextStyle(
                        color: MyColors.ash,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter Email ";
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
                            height: 5 * 50 + 60,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 150, 196, 215),
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
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: const Center(
                                            child: Text(
                                              'Select Product',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  fontStyle: FontStyle.normal),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // const SizedBox(height: 6),
                                    Container(
                                      height: 5 * 50 + 60,
                                      width: Get.width / 1.3,
                                      color: Color.fromARGB(255, 150, 196, 215),
                                      child: ListView.builder(
                                          itemCount: 5,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return InkWell(
                                              onTap: () {
                                                mediumController.text =
                                                    data[index];

                                                Navigator.of(context).pop();
                                              },
                                              splashColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 4, bottom: 4),
                                                height: 40,
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    color: MyColors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                  child: Text(
                                                    data[index],
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                        fontStyle:
                                                            FontStyle.normal),
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
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Name",
                          style: TextStyle(
                              color: MyColors.ash,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Iphone 11 64GB",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product stock",
                          style: TextStyle(
                              color: MyColors.ash,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Product Price",
                  style: TextStyle(
                      color: MyColors.ash,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "\$212",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  height: Get.height / 17.5833333333,
                  child: TextFormField(
                    // controller: controller.emailController,
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
                      hintText: "Discounted Price",
                      hintStyle: TextStyle(
                        color: MyColors.ash,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please enter Email ";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(child: Container()),
                Container(
                  // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: MaterialButton(
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   Get.find<SignInController>().isLoading.value =
                      //       true;
                      //   controller.onLoginPressed();
                      // }
                      Get.to(() => AddProductPricePage());
                    },
                    color: MyColors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Container(
                      height: 48,
                      width: Get.width,
                      alignment: Alignment.center,
                      //margin: const EdgeInsets.only(top: 16, bottom: 16),
                      child: const Text(
                        " Create Discount",
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
