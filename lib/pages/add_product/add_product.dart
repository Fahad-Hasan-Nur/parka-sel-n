import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/my_app_bar.dart';
import 'package:paikariwala_seller/pages/add_product/add_product_price.dart';
import 'package:paikariwala_seller/pages/add_product/add_varient.dart';

import '../../utils/colors.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController varientTypeController = TextEditingController();
  final TextEditingController varientNameController = TextEditingController();
  final TextEditingController varientWeightController = TextEditingController();
  final TextEditingController varientUnitController = TextEditingController();
  final TextEditingController varientStockController = TextEditingController();

  List<String> unitData = ["Box", "Piece"];

  final TextEditingController unitTypeController = TextEditingController();
  _createWallet(context1) {
    showDialog(
        context: context1,
        builder: (BuildContext context2) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 82, 82, 82)),
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15)),
              constraints: BoxConstraints(maxHeight: 220, maxWidth: 380),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: const Text(
                          "Select Currency for Wallet",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: (() {
                          setState(() {});
                        }),
                        child: Container(
                          // height: Get.height / 17.5833333333,
                          //   width: Get.width / 5,
                          child: Row(children: [
                            Container(
                              height: 14,
                              width: 14,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: MyColors.yellow,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Make This Primary Wallet",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                              ),
                            )
                          ]),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                        child: MaterialButton(
                          onPressed: () async {},
                          color: MyColors.yellow,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Container(
                            height: 48,
                            width: Get.width,
                            alignment: Alignment.center,
                            //margin: const EdgeInsets.only(top: 16, bottom: 16),
                            child: const Text(
                              "Create Wallet",
                              style: TextStyle(
                                  color: Colors.black,
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
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
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    height: Get.height / 17.5833333333,
                    child: TextFormField(
                      readOnly: true,
                      controller: categoryController,
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
                        hintText: "Category",
                        hintStyle: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "  Please select category ";
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
                          isScrollControlled: false,
                          backgroundColor: Colors.black,
                          builder: (BuildContext builder) {
                            return SingleChildScrollView(
                              child: Container(
                                height: Get.find<ProductController>()
                                            .categoryList
                                            .length *
                                        50 +
                                    100,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    // borderRadius: BorderRadius.only(
                                    //   topLeft: Radius.circular(20),
                                    //   topRight: Radius.circular(20),
                                    // ),
                                    borderRadius: BorderRadius.circular(20)),
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
                                                'Select Category',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
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
                                        height: Get.find<ProductController>()
                                                    .categoryList
                                                    .length *
                                                50 +
                                            60,
                                        width: Get.width / 1.3,
                                        color: Colors.black,
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                Get.find<ProductController>()
                                                    .categoryList
                                                    .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  categoryController
                                                      .text = Get.find<
                                                          ProductController>()
                                                      .categoryList[index]
                                                      .name
                                                      .toString();
                                                  Get.find<ProductController>()
                                                      .categoryId
                                                      .value = Get.find<
                                                          ProductController>()
                                                      .categoryList[index]
                                                      .id
                                                      .toString();

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
                                                      color: MyColors.appColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      Get.find<
                                                              ProductController>()
                                                          .categoryList[index]
                                                          .name
                                                          .toString(),
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    height: Get.height / 17.5833333333,
                    child: TextFormField(
                      readOnly: true,
                      controller: brandController,
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
                        hintText: "Brand",
                        hintStyle: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return " Please select Brand ";
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
                          isScrollControlled: false,
                          backgroundColor: Colors.black,
                          builder: (BuildContext builder) {
                            return Container(
                              height: Get.find<ProductController>()
                                          .brandList
                                          .length *
                                      50 +
                                  60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
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
                                                'Select Brand',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
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
                                        height: Get.find<ProductController>()
                                                    .brandList
                                                    .length *
                                                50 +
                                            60,
                                        width: Get.width / 1.3,
                                        color: Colors.black,
                                        child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                Get.find<ProductController>()
                                                    .brandList
                                                    .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  brandController
                                                      .text = Get.find<
                                                          ProductController>()
                                                      .brandList[index]
                                                      .name
                                                      .toString();

                                                  Get.find<ProductController>()
                                                      .brandId
                                                      .value = Get.find<
                                                          ProductController>()
                                                      .brandList[index]
                                                      .id
                                                      .toString();

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
                                                      color: MyColors.appColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Center(
                                                    child: Text(
                                                      Get.find<
                                                              ProductController>()
                                                          .brandList[index]
                                                          .name
                                                          .toString(),
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
                  Text(
                    "Product Basic Details",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: const Text(
                      "Product Name *",
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
                        // errorBorder: OutlineInputBorder(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(8.0)),
                        //     borderSide: BorderSide(
                        //       width: 1,
                        //       color: Colors.red,
                        //     )),
                        // focusedErrorBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        //   borderSide: BorderSide(
                        //     width: 1,
                        //     color: Colors.red,
                        //   ),
                        // ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "  Please enter Name ";
                        } else if (value.length < 3) {
                          return "  Name must be at least 3 characters ";
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
                      "Product SKU *",
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
                      controller: skuController,
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
                          return "  Please enter SKU ";
                        } else if (value.length < 10) {
                          return "  SKU must be at least 10 characters ";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              "Stock *",
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
                            width: Get.width / 2 - 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            height: Get.height / 17.5833333333,
                            child: TextFormField(
                              controller: stockController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              // inputFormatters: <TextInputFormatter>[
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
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
                                  return " Please enter Stock ";
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: const Text(
                              "Unit Type *",
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
                            width: Get.width / 2 - 18,
                            height: Get.height / 17.5833333333,
                            child: TextFormField(
                              readOnly: true,
                              controller: unitTypeController,
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
                                  return "  Please Unit Type";
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
                                  backgroundColor: Colors.black,
                                  isScrollControlled: true,
                                  builder: (BuildContext builder) {
                                    return Container(
                                      height: 2 * 50 + 60,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: SingleChildScrollView(
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              const SizedBox(height: 16),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                    width: Get.width,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 30),
                                                    child: const Center(
                                                      child: Text(
                                                        'Select Unit Type',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 16,
                                                            fontStyle: FontStyle
                                                                .normal),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // const SizedBox(height: 6),
                                              Container(
                                                height: 2 * 50 + 60,
                                                width: Get.width / 1.3,
                                                color: Colors.black,
                                                child: ListView.builder(
                                                    itemCount: 2,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          unitTypeController
                                                                  .text =
                                                              unitData[index];
                                                          Get.find<
                                                                  ProductController>()
                                                              .pUnitType
                                                              .value = unitData[
                                                                  index]
                                                              .toLowerCase();

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        splashColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 4,
                                                                  bottom: 4),
                                                          height: 40,
                                                          width: Get.width,
                                                          decoration: BoxDecoration(
                                                              color: MyColors
                                                                  .appColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                          child: Center(
                                                            child: Text(
                                                              unitData[index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
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
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      "Varients *",
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
                  Obx((() => Get.find<ProductController>().varientList.length >
                          0
                      ? Container(
                          height:
                              Get.find<ProductController>().varientList.length *
                                  (Get.height / 17.5833333333 + 10),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: ((context, index) => Column(
                                  children: [
                                    Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: Get.height / 17.5833333333,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("   " +
                                              Get.find<ProductController>()
                                                  .varientList[index]
                                                  .name
                                                  .toString()),
                                          GestureDetector(
                                            onTap: (() {
                                              setState(() {
                                                Get.find<ProductController>()
                                                    .varientList
                                                    .removeAt(index);
                                              });
                                            }),
                                            child: Container(
                                              height:
                                                  Get.height / 17.5833333333,
                                              width: Get.height / 17.5833333333,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                              )),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )),
                          ),
                        )
                      : Container())),
                  Container(
                    key: _formKey1,
                    // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                    child: MaterialButton(
                      onPressed: () {
                        Get.to(AddVarientPage());
                      },
                      color: MyColors.appColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        height: 48,
                        width: Get.width / 10,
                        alignment: Alignment.center,
                        //margin: const EdgeInsets.only(top: 16, bottom: 16),
                        child: const Text(
                          "Add",
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
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      "Product Description",
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
                    height: 103,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      maxLines: 50,
                      minLines: 1,
                      controller: descriptionController,
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
                          return " Please enter Description ";
                        } else if (value.length < 10) {
                          return "Minimum 10 Characters";
                        } else if (value.length > 500) {
                          return "Maximum 500 Characters";
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
                      "*Minimum 500 words",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (Get.find<ProductController>().varientList.length >
                              0) {
                            Get.find<ProductController>().pName.value =
                                nameController.text;
                            Get.find<ProductController>().pSku.value =
                                skuController.text;
                            Get.find<ProductController>().pStock.value =
                                stockController.text;
                            Get.find<ProductController>().pUnitType.value =
                                unitTypeController.text;
                            Get.find<ProductController>().pDesc.value =
                                descriptionController.text;
                            Get.to(() => AddProductPricePage());
                          } else {
                            Get.snackbar(" Error", "Need at least 1 varient",
                                duration: Duration(seconds: 2),
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: MyColors.blue);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
