import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/pages/order/order_detail_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../controllers/order_controller.dart';
import '../../utils/colors.dart';
import '../../utils/global_size.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String selectedfilter = "";
  GlobalSize size = GlobalSize();
  RefreshController _refreshController =
      RefreshController(initialRefresh: true);
  Future<void> _onRefresh() async {
    await Get.find<OrderController>().getOrders();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Orders",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        Get.find<ProductController>().selected.value =
                            "Approved";
                      });
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 36,
                      width: Get.width / 2 - 16,
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColors.appColor),
                          color: Get.find<ProductController>().selected.value ==
                                  "Approved"
                              ? MyColors.appColor
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "Pending",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Get.find<ProductController>().selected.value ==
                                        "Approved"
                                    ? Colors.white
                                    : MyColors.appColor),
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      setState(() {
                        Get.find<ProductController>().selected.value =
                            "Pending";
                      });
                    }),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      height: 36,
                      width: Get.width / 2 - 16,
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColors.appColor),
                          color: Get.find<ProductController>().selected.value ==
                                  "Pending"
                              ? MyColors.appColor
                              : Colors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              topRight: Radius.circular(5))),
                      child: Center(
                          child: Text(
                        "Approved",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                Get.find<ProductController>().selected.value ==
                                        "Pending"
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
                () => Get.find<ProductController>().selected.value == "Approved"
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            Get.find<OrderController>().pendingOrderList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (() async {
                              Get.find<OrderController>().detailOrder.value =
                                  Get.find<OrderController>()
                                      .pendingOrderList[index];
                              await Get.find<OrderController>().getOrderDetails(
                                  Get.find<OrderController>()
                                      .pendingOrderList[index]
                                      .id
                                      .toString());
                              Get.to(() => OrderDetailPage());
                            }),
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(16),
                                height: Get.height / size.getHeight(157),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .pendingOrderList[index]
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
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .pendingOrderList[index]
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
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "City",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                ),
                                                Text(
                                                  Get.find<OrderController>()
                                                      .pendingOrderList[index]
                                                      .city
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Price",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .pendingOrderList[index]
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
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Discount",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                ),
                                                Text(
                                                  Get.find<OrderController>()
                                                      .pendingOrderList[index]
                                                      .discount
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
                                                  "Status",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                ),
                                                const Text(
                                                  "Pending",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.yellow,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                )),
                          );
                        })
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: Get.find<OrderController>()
                            .approvedOrderList
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (() async {
                              Get.find<OrderController>().detailOrder.value =
                                  Get.find<OrderController>()
                                      .approvedOrderList[index];
                              await Get.find<OrderController>().getOrderDetails(
                                  Get.find<OrderController>()
                                      .approvedOrderList[index]
                                      .id
                                      .toString());
                              Get.to(() => OrderDetailPage());
                            }),
                            child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(16),
                                height: Get.height / size.getHeight(151),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 205, 205, 205),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .approvedOrderList[index]
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
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .approvedOrderList[index]
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
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "City",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                ),
                                                Text(
                                                  Get.find<OrderController>()
                                                      .approvedOrderList[index]
                                                      .city
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Discount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .approvedOrderList[index]
                                              .discount
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
                                          "Total Price",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .approvedOrderList[index]
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
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Delivery Charge",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black
                                                          .withOpacity(.5)),
                                                ),
                                                Text(
                                                  Get.find<OrderController>()
                                                      .approvedOrderList[index]
                                                      .totalDeliveryCharge
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        Text(
                                          Get.find<OrderController>()
                                              .approvedOrderList[index]
                                              .subTotal
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
                                          "Status",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Colors.black.withOpacity(.5)),
                                        ),
                                        const Text(
                                          "Approved",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: MyColors.appColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
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
    );
  }
}
