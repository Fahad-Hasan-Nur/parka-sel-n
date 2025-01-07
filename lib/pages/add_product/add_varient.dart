import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/model/variant.dart';
import 'package:paikariwala_seller/my_app_bar.dart';

import '../../utils/colors.dart';

class AddVarientPage extends StatefulWidget {
  AddVarientPage({Key? key}) : super(key: key);

  @override
  _AddVarientPageState createState() => _AddVarientPageState();
}

class _AddVarientPageState extends State<AddVarientPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController varientTypeController = TextEditingController();
  final TextEditingController varientNameController = TextEditingController();
  final TextEditingController varientWeightController = TextEditingController();
  final TextEditingController varientUnitController = TextEditingController();
  final TextEditingController varientStockController = TextEditingController();

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
                        "Add Varient",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: const Text(
                      "Varient Name *",
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
                      controller: varientNameController,
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
                          return "  Please enter Name ";
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
                      "Varient Type *",
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
                      controller: varientTypeController,
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
                          return "  Please enter Varient type ";
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
                      "Varient Weight *",
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
                      controller: varientWeightController,
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
                          return "  Please enter Varient weight ";
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
                      "Varient Weight Unit *",
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
                      controller: varientUnitController,
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
                          return "  Please enter Varient Weight Unit ";
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
                      "Varient Stock *",
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
                      controller: varientStockController,
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
                          return "  Please enter Varient Stock ";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // margin: const EdgeInsets.only(top: 30, left: 50, right: 50),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Variant data = Variant();
                          data.name = varientNameController.text;
                          data.type = varientTypeController.text;
                          data.wgt = varientWeightController.text;
                          data.wgtUnit = varientWeightController.text;
                          data.stock = varientStockController.text;
                          Get.find<ProductController>().varientList.add(data);

                          Get.back();
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
