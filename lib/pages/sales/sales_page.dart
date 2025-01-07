import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/order_controller.dart';
import '../../utils/colors.dart';
import '../../utils/global_size.dart';
import '../order/order_detail_page.dart';

class SalesPage extends StatefulWidget {
  SalesPage({Key? key}) : super(key: key);

  @override
  _SalesPageState createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  GlobalSize size = GlobalSize();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  Future<void> _onRefresh() async {
    await Get.find<OrderController>().getOrders();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: Obx(() => Visibility(
            visible: !(Get.find<OrderController>().isLoadingSales.value),
            replacement: Container(
              color: MyColors.white,
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Lottie.asset("assets/animations/loading.json")),
            ),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Sales Management",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              Get.find<OrderController>().selected.value =
                                  'Processed';
                            });
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 36,
                            width: Get.width / 2 - 16,
                            decoration: BoxDecoration(
                                border: Border.all(color: MyColors.appColor),
                                color: Get.find<OrderController>()
                                            .selected
                                            .value ==
                                        'Processed'
                                    ? MyColors.appColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Center(
                                child: Text(
                              "Processed",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Get.find<OrderController>()
                                              .selected
                                              .value ==
                                          'Processed'
                                      ? Colors.white
                                      : MyColors.appColor),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            setState(() {
                              Get.find<OrderController>().selected.value =
                                  'Delivered';
                            });
                          }),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 36,
                            width: Get.width / 2 - 16,
                            decoration: BoxDecoration(
                                border: Border.all(color: MyColors.appColor),
                                color: Get.find<OrderController>()
                                            .selected
                                            .value ==
                                        'Delivered'
                                    ? MyColors.appColor
                                    : Colors.white,
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    topRight: Radius.circular(5))),
                            child: Center(
                                child: Text(
                              "Delivered",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Get.find<OrderController>()
                                              .selected
                                              .value ==
                                          'Delivered'
                                      ? Colors.white
                                      : MyColors.appColor),
                            )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => Get.find<OrderController>().selected.value ==
                              'Processed'
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: Get.find<OrderController>()
                                  .processedOrderList
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (() async {
                                    Get.find<OrderController>()
                                            .detailOrder
                                            .value =
                                        Get.find<OrderController>()
                                            .processedOrderList[index];
                                    await Get.find<OrderController>()
                                        .getOrderDetails(
                                            Get.find<OrderController>()
                                                .processedOrderList[index]
                                                .id
                                                .toString());
                                    Get.to(() => OrderDetailPage());
                                  }),
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(16),
                                      height: Get.height / size.getHeight(230),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            const BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order ID",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .processedOrderList[index]
                                                    .id
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .processedOrderList[index]
                                                    .firstName
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "City",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .processedOrderList[
                                                                index]
                                                            .city
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Discount",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .processedOrderList[
                                                                index]
                                                            .discount
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.find<
                                                                  OrderController>()
                                                              .isLoadingSales
                                                              .value = true;
                                                          var map = new Map<
                                                              String,
                                                              dynamic>();
                                                          map["status"] =
                                                              "delivered";

                                                          Get.find<
                                                                  OrderController>()
                                                              .updateOrderStatus(
                                                                  Get.find<
                                                                          OrderController>()
                                                                      .processedOrderList[
                                                                          index]
                                                                      .id
                                                                      .toString(),
                                                                  map);
                                                        },
                                                        child: Container(
                                                          height: Get.height /
                                                              size.getHeight(
                                                                  30),
                                                          width: Get.width /
                                                              size.getWidth(70),
                                                          decoration: BoxDecoration(
                                                              color: MyColors
                                                                  .appColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: const Center(
                                                            child: Text(
                                                              "Deliver",
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Discount",
                                              //   style: TextStyle(
                                              //       fontSize: 14,
                                              //       fontWeight: FontWeight.w400,
                                              //       color: Colors.black
                                              //           .withOpacity(.5)),
                                              // ),
                                              // Text(
                                              //   Get.find<OrderController>()
                                              //       .processedOrderList[index]
                                              //       .discount
                                              //       .toString(),
                                              //   style: TextStyle(
                                              //     fontSize: 16,
                                              //     fontWeight: FontWeight.w500,
                                              //   ),
                                              // ),
                                              // const SizedBox(
                                              //   height: 10,
                                              // ),
                                              Text(
                                                "Total Price",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .processedOrderList[index]
                                                    .totalPrice
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Delivery Charge",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .processedOrderList[
                                                                index]
                                                            .totalDeliveryCharge
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Sub Total",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .processedOrderList[
                                                                index]
                                                            .subTotal
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        capitalize(Get.find<
                                                                OrderController>()
                                                            .processedOrderList[
                                                                index]
                                                            .status
                                                            .toString()),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              MyColors.appColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     // Text(
                                          //     //   "Sub Total",
                                          //     //   style: TextStyle(
                                          //     //       fontSize: 14,
                                          //     //       fontWeight: FontWeight.w400,
                                          //     //       color: Colors.black
                                          //     //           .withOpacity(.5)),
                                          //     // ),
                                          //     // Text(
                                          //     //   Get.find<OrderController>()
                                          //     //       .processedOrderList[index]
                                          //     //       .subTotal
                                          //     //       .toString(),
                                          //     //   style: TextStyle(
                                          //     //     fontSize: 16,
                                          //     //     fontWeight: FontWeight.w500,
                                          //     //   ),
                                          //     // ),
                                          //     // const SizedBox(
                                          //     //   height: 10,
                                          //     // ),
                                          //     // Text(
                                          //     //   "Status",
                                          //     //   style: TextStyle(
                                          //     //       fontSize: 14,
                                          //     //       fontWeight: FontWeight.w400,
                                          //     //       color: Colors.black
                                          //     //           .withOpacity(.5)),
                                          //     // ),
                                          //     // Text(
                                          //     //   capitalize(
                                          //     //       Get.find<OrderController>()
                                          //     //           .processedOrderList[index]
                                          //     //           .status
                                          //     //           .toString()),
                                          //     //   style: TextStyle(
                                          //     //     fontSize: 16,
                                          //     //     color: MyColors.appColor,
                                          //     //     fontWeight: FontWeight.w500,
                                          //     //   ),
                                          //     // ),
                                          //     const SizedBox(
                                          //       height: 10,
                                          //     ),
                                          //     const SizedBox(
                                          //       height: 10,
                                          //     ),
                                          //     GestureDetector(
                                          //       onTap: () {
                                          //         Get.find<OrderController>()
                                          //             .isLoadingSales
                                          //             .value = true;
                                          //         var map =
                                          //             new Map<String, dynamic>();
                                          //         map["status"] = "delivered";

                                          //         Get.find<OrderController>()
                                          //             .updateOrderStatus(
                                          //                 Get.find<
                                          //                         OrderController>()
                                          //                     .processedOrderList[
                                          //                         index]
                                          //                     .id
                                          //                     .toString(),
                                          //                 map);
                                          //       },
                                          //       child: Container(
                                          //         height: Get.height /
                                          //             size.getHeight(30),
                                          //         width: Get.width /
                                          //             size.getWidth(70),
                                          //         decoration: BoxDecoration(
                                          //             color: MyColors.appColor,
                                          //             borderRadius:
                                          //                 BorderRadius.circular(
                                          //                     5)),
                                          //         child: const Center(
                                          //           child: Text(
                                          //             "Deliver",
                                          //             style: TextStyle(
                                          //                 fontSize: 14,
                                          //                 fontWeight:
                                          //                     FontWeight.w600,
                                          //                 color: Colors.white),
                                          //           ),
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      )),
                                );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: Get.find<OrderController>()
                                  .deliveredOrderList
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: (() async {
                                    Get.find<OrderController>()
                                            .detailOrder
                                            .value =
                                        Get.find<OrderController>()
                                            .deliveredOrderList[index];
                                    await Get.find<OrderController>()
                                        .getOrderDetails(
                                            Get.find<OrderController>()
                                                .deliveredOrderList[index]
                                                .id
                                                .toString());
                                    Get.to(() => OrderDetailPage());
                                  }),
                                  child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.all(16),
                                      height: Get.height / size.getHeight(200),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            const BoxShadow(
                                              color: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Order ID",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .deliveredOrderList[index]
                                                    .id
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .deliveredOrderList[index]
                                                    .firstName
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "City",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .deliveredOrderList[
                                                                index]
                                                            .city
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Discount",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .deliveredOrderList[
                                                                index]
                                                            .discount
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  // const SizedBox(
                                                  //   width: 50,
                                                  // ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Text(
                                              //   "Discount",
                                              //   style: TextStyle(
                                              //       fontSize: 14,
                                              //       fontWeight: FontWeight.w400,
                                              //       color: Colors.black
                                              //           .withOpacity(.5)),
                                              // ),
                                              // Text(
                                              //   Get.find<OrderController>()
                                              //       .deliveredOrderList[index]
                                              //       .discount
                                              //       .toString(),
                                              //   style: TextStyle(
                                              //     fontSize: 16,
                                              //     fontWeight: FontWeight.w500,
                                              //   ),
                                              // ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Total Price",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black
                                                        .withOpacity(.5)),
                                              ),
                                              Text(
                                                Get.find<OrderController>()
                                                    .deliveredOrderList[index]
                                                    .totalPrice
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Delivery Charge",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .deliveredOrderList[
                                                                index]
                                                            .totalDeliveryCharge
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Sub Total",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        Get.find<
                                                                OrderController>()
                                                            .deliveredOrderList[
                                                                index]
                                                            .subTotal
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Status",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    .5)),
                                                      ),
                                                      Text(
                                                        capitalize(Get.find<
                                                                OrderController>()
                                                            .deliveredOrderList[
                                                                index]
                                                            .status
                                                            .toString()),
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              MyColors.appColor,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     // Text(
                                          //     //   "Sub Total",
                                          //     //   style: TextStyle(
                                          //     //       fontSize: 14,
                                          //     //       fontWeight: FontWeight.w400,
                                          //     //       color: Colors.black
                                          //     //           .withOpacity(.5)),
                                          //     // ),
                                          //     // Text(
                                          //     //   Get.find<OrderController>()
                                          //     //       .deliveredOrderList[index]
                                          //     //       .subTotal
                                          //     //       .toString(),
                                          //     //   style: TextStyle(
                                          //     //     fontSize: 16,
                                          //     //     fontWeight: FontWeight.w500,
                                          //     //   ),
                                          //     // ),
                                          //     // const SizedBox(
                                          //     //   height: 10,
                                          //     // ),
                                          //     // Text(
                                          //     //   "Status",
                                          //     //   style: TextStyle(
                                          //     //       fontSize: 14,
                                          //     //       fontWeight: FontWeight.w400,
                                          //     //       color: Colors.black
                                          //     //           .withOpacity(.5)),
                                          //     // ),
                                          //     // Text(
                                          //     //   capitalize(
                                          //     //       Get.find<OrderController>()
                                          //     //           .deliveredOrderList[index]
                                          //     //           .status
                                          //     //           .toString()),
                                          //     //   style: TextStyle(
                                          //     //     fontSize: 16,
                                          //     //     color: MyColors.appColor,
                                          //     //     fontWeight: FontWeight.w500,
                                          //     //   ),
                                          //     // ),
                                          //     const SizedBox(
                                          //       height: 10,
                                          //     ),
                                          //   ],
                                          // ),
                                        ],
                                      )),
                                );
                              },
                            ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
