import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/order_controller.dart';
import 'package:paikariwala_seller/pages/add_product/add_product.dart';

import '../../controllers/home_controller.dart';
import '../../controllers/product_controller.dart';
import '../../dashboard.dart';
import '../../utils/colors.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              const Center(
                child: Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.to(AddProductPage());
                    }),
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Add Product",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          child: Icon(
                            Icons.add_circle_outlined,
                            color: MyColors.appColor,
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                      ]),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: (() {
                      Get.find<ProductController>().selected.value = "Approved";
                      Get.find<HomeController>().currentIndex.value = 1;
                      Get.offAll(() => MyApp());
                    }),
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "New Order",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 21,
                          child: Icon(
                            Icons.inventory,
                            color: Color.fromARGB(255, 8, 247, 0),
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(
                                Get.find<OrderController>()
                                    .pendingOrderList
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.find<ProductController>().selected.value = "Approved";
                      Get.find<HomeController>().currentIndex.value = 1;
                      Get.offAll(() => MyApp());
                    }),
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pending Orders",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 21,
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(
                                Get.find<OrderController>()
                                    .pendingOrderList
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: (() {
                      Get.find<ProductController>().selected.value = "Pending";
                      Get.find<HomeController>().currentIndex.value = 1;
                      Get.offAll(() => MyApp());
                    }),
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Approved Order",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 21,
                          child: Icon(
                            Icons.check,
                            color: Color.fromARGB(255, 0, 213, 25),
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(
                                Get.find<OrderController>()
                                    .approvedOrderList
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.find<OrderController>().selected.value = "Processed";
                      Get.find<HomeController>().currentIndex.value = 3;
                      Get.offAll(() => const MyApp());
                    },
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Processed Order",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 21,
                          child: Icon(
                            Icons.published_with_changes,
                            color: Color.fromARGB(255, 204, 183, 0),
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(
                                Get.find<OrderController>()
                                    .processedOrderList
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.find<OrderController>().selected.value = "Delivered";
                      Get.find<HomeController>().currentIndex.value = 3;
                      Get.offAll(() => const MyApp());
                    },
                    child: Container(
                      height: Get.height / 7.88785046729,
                      width: Get.width / 2.29411764706,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 205, 205, 205),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Delivered Order",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 30,
                          width: 21,
                          child: Icon(
                            Icons.real_estate_agent,
                            color: MyColors.appColor,
                            size: 40,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: Text(
                                Get.find<OrderController>()
                                    .deliveredOrderList
                                    .length
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  // Container(
                  //   height: Get.height / 7.88785046729,
                  //   width: Get.width / 2.29411764706,
                  //   decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Color.fromARGB(255, 205, 205, 205),
                  //           spreadRadius: 1,
                  //           blurRadius: 5,
                  //           offset: const Offset(0, 5),
                  //         ),
                  //       ],
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(5)),
                  //   child: Column(children: [
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Text(
                  //       "Returned Order",
                  //       style: TextStyle(
                  //           fontSize: 13, fontWeight: FontWeight.w600),
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     Container(
                  //       height: 30,
                  //       width: 21,
                  //       child: Icon(
                  //         Icons.assignment_return,
                  //         color: MyColors.appColor,
                  //         size: 40,
                  //       ),
                  //     ),
                  //     Expanded(child: Container()),
                  //     Row(
                  //       children: [
                  //         Expanded(child: Container()),
                  //         Padding(
                  //           padding:
                  //               const EdgeInsets.only(right: 10, bottom: 10),
                  //           child: Text(
                  //             "21",
                  //             style: TextStyle(
                  //                 fontSize: 24, fontWeight: FontWeight.w600),
                  //           ),
                  //         )
                  //       ],
                  //     )
                  //   ]),
                  // ),
                  // Expanded(child: Container()),
                  Container(
                    height: Get.height / 7.88785046729,
                    width: Get.width / 2.29411764706,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 205, 205, 205),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Canceled Order",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 30,
                        width: 21,
                        child: Icon(
                          Icons.remove_shopping_cart,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: Text(
                              Get.find<OrderController>()
                                  .canceledOrderList
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Product Activities",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    height: Get.height / 7.88785046729,
                    width: Get.width / 2.29411764706,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 205, 205, 205),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pending Products",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 21,
                        child: Icon(
                          Icons.timer,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: Text(
                              Get.find<ProductController>()
                                  .pendingProductList
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: Get.height / 7.88785046729,
                    width: Get.width / 2.29411764706,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 205, 205, 205),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rejected Products",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 21,
                        child: Icon(
                          Icons.free_cancellation,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Expanded(child: Container()),
                      Row(
                        children: [
                          Expanded(child: Container()),
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 10),
                            child: Text(
                              Get.find<ProductController>()
                                  .declinedProductList
                                  .length
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ]),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
        ));
  }
}
