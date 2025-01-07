import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/pages/add_product/product_details.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Text(
            "Products",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          // Container(
          //   //      padding: EdgeInsets.only(left: 10),
          //   alignment: Alignment.centerLeft,
          //   height: 37,
          //   width: Get.width - 32,
          //   padding: EdgeInsets.only(left: 16),
          //   decoration: BoxDecoration(boxShadow: [
          //     BoxShadow(
          //       color: Color.fromARGB(255, 205, 205, 205),
          //       spreadRadius: .5,
          //       blurRadius: 10,
          //       offset: const Offset(0, 5),
          //     ),
          //   ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.search,
          //         color: MyColors.ash,
          //       ),
          //       Text("Search product here...")
          //     ],
          //   ),
          // ),

          SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              //   scrollDirection: Axis.horizontal,
              itemCount:
                  (Get.find<ProductController>().productList.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: Get.height / 4.09708737864,
                  width: Get.width / 2.26744186047,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Get.find<ProductController>().selectedProduct.value =
                              Get.find<ProductController>()
                                  .productList[(index * 2)];
                          Get.to(ProductDetailPage());
                        }),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 205, 205, 205),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Get.find<ProductController>()
                                          .productList[index * 2]
                                          .photos!
                                          .length >
                                      0
                                  ? Container(
                                      height: Get.height / 8.70103092784,
                                      width: Get.width / 2.26744186047,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              Get.find<ProductController>()
                                                  .productList[index * 2]
                                                  .photos![0]
                                                  .photo
                                                  .toString(),
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5))),
                                    )
                                  : Container(
                                      height: Get.height / 8.70103092784,
                                      width: Get.width / 2.26744186047,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/iphone.png")),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5))),
                                    ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text(
                                  Get.find<ProductController>()
                                      .productList[index * 2]
                                      .name
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                width: Get.width / 2.6,
                                child: Text(
                                  Get.find<ProductController>()
                                      .productList[index * 2]
                                      .description
                                      .toString(),
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Container(
                                width: Get.width / 2.6,
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "BDT " +
                                          "${Get.find<ProductController>().productList[index * 2].salePrice.toString()}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      ((index * 2) + 2) <=
                              Get.find<ProductController>().productList.length
                          ? GestureDetector(
                              onTap: (() {
                                Get.find<ProductController>()
                                        .selectedProduct
                                        .value =
                                    Get.find<ProductController>()
                                        .productList[(index * 2) + 1];
                                Get.to(ProductDetailPage());
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 205, 205, 205),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Get.find<ProductController>()
                                                .productList[(index * 2) + 1]
                                                .photos!
                                                .length >
                                            0
                                        ? Container(
                                            height: Get.height / 8.70103092784,
                                            width: Get.width / 2.26744186047,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: NetworkImage(
                                                    Get.find<
                                                            ProductController>()
                                                        .productList[
                                                            (index * 2) + 1]
                                                        .photos![0]
                                                        .photo
                                                        .toString(),
                                                  ),
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5))),
                                          )
                                        : Container(
                                            height: Get.height / 8.70103092784,
                                            width: Get.width / 2.26744186047,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        "assets/iphone.png")),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5))),
                                          ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Text(
                                        Get.find<ProductController>()
                                            .productList[(index * 2) + 1]
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      width: Get.width / 2.6,
                                      child: Text(
                                        Get.find<ProductController>()
                                            .productList[index * 2]
                                            .description
                                            .toString(),
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    Container(
                                      //  width: Get.width / 2.6,
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Row(
                                          //   children: [
                                          //     Icon(Icons.add_box_rounded),
                                          //     Text(Get.find<ProductController>()
                                          //         .productList[index * 2]
                                          //         .minQty
                                          //         .toString()),
                                          //   ],
                                          // ),

                                          Text(
                                            "BDT " +
                                                "${Get.find<ProductController>().productList[(index * 2) + 1].salePrice.toString()}",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
