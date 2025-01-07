import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/dashboard.dart';
import 'package:paikariwala_seller/pages/add_product/add_product.dart';
import 'package:paikariwala_seller/pages/home/cash_transfer_page.dart';
import 'package:paikariwala_seller/utils/colors.dart';

import 'controllers/home_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      width: Get.width / 2,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/Paikariwala.png")),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 43,
              //  decoration: BoxDecoration(border: Border.all()),
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: MyColors.appColor,
                  size: 20,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Get.find<HomeController>().currentIndex.value = 0;
                  Get.offAll(() => const MyApp());
                },
              ),
            ),
            Container(
              height: 43,
              child: ListTile(
                leading: Icon(
                  Icons.list_alt,
                  color: MyColors.appColor,
                  size: 20,
                ),
                title: Text(
                  "Order",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Get.find<HomeController>().currentIndex.value = 1;
                  Get.offAll(() => const MyApp());
                },
              ),
            ),
            Container(
              height: 43,
              child: ListTile(
                leading: Icon(
                  Icons.inbox,
                  color: MyColors.appColor,
                  size: 20,
                ),
                title: Text(
                  "Product",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Get.find<HomeController>().currentIndex.value = 2;
                  Get.offAll(() => const MyApp());
                },
              ),
            ),
            Container(
              height: 43,
              child: ListTile(
                leading: Icon(
                  Icons.real_estate_agent,
                  color: MyColors.appColor,
                  size: 20,
                ),
                title: Text(
                  "Sales",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Get.find<HomeController>().currentIndex.value = 3;
                  Get.offAll(() => MyApp());
                },
              ),
            ),
            Container(
              height: 43,
              child: ListTile(
                leading: Icon(
                  Icons.currency_bitcoin,
                  color: MyColors.appColor,
                  size: 20,
                ),
                title: Text(
                  "Cash Transfer",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  //Get.find<HomeController>().currentIndex.value = 3;
                  Get.to(() => CashTransferPage());
                },
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: (() {
                Get.to(() => AddProductPage());
              }),
              child: Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: MyColors.appColor,
                    borderRadius: BorderRadius.circular(25)),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
