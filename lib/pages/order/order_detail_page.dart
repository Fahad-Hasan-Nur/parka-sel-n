import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/my_app_bar.dart';

import '../../controllers/order_controller.dart';
import '../../utils/colors.dart';
import '../../utils/global_size.dart';

class OrderDetailPage extends StatefulWidget {
  OrderDetailPage({Key? key}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

const List<String> country = ["BD", "US", "BD", "US", "BD"];
GlobalSize size = GlobalSize();

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Order Details",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: Get.find<OrderController>().orderDetailList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(Get.find<OrderController>()
                          .orderDetailList[index]
                          .productPhotos![0]
                          .photo
                          .toString());
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(16),
                        height: Get.height / size.getHeight(114),
                        decoration: BoxDecoration(
                            boxShadow: [
                              const BoxShadow(
                                color: Color.fromARGB(255, 205, 205, 205),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: Get.height / size.getHeight(90),
                              width: Get.width / size.getWidth(90),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black.withOpacity(.08),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      Get.find<OrderController>()
                                          .orderDetailList[index]
                                          .productPhotos![0]
                                          .photo
                                          .toString()),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Get.find<OrderController>()
                                      .orderDetailList[index]
                                      .product!
                                      .name
                                      .toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "BDT " +
                                      Get.find<OrderController>()
                                          .orderDetailList[index]
                                          .product!
                                          .salePrice
                                          .toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.appColor),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Product Basic Details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order ID",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Get.find<OrderController>()
                          .detailOrder
                          .value
                          .id
                          .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Customer Details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Customer Name",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Get.find<OrderController>()
                              .detailOrder
                              .value
                              .firstName
                              .toString() +
                          " " +
                          Get.find<OrderController>()
                              .detailOrder
                              .value
                              .lastName
                              .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      Get.find<OrderController>()
                          .detailOrder
                          .value
                          .email
                          .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Address",
              style: TextStyle(
                  color: MyColors.ash,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              Get.find<OrderController>()
                  .detailOrder
                  .value
                  .addressLine1
                  .toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Payment Details",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Amount",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "BDT " +
                          Get.find<OrderController>()
                              .detailOrder
                              .value
                              .totalPrice
                              .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Charge",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "BDT " +
                          Get.find<OrderController>()
                              .detailOrder
                              .value
                              .totalDeliveryCharge
                              .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discount",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "BDT " +
                          Get.find<OrderController>()
                              .detailOrder
                              .value
                              .discount
                              .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sub Total",
                      style: TextStyle(
                          color: MyColors.ash,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "BDT " +
                          Get.find<OrderController>()
                              .detailOrder
                              .value
                              .subTotal
                              .toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
