import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/my_app_bar.dart';
import 'package:paikariwala_seller/my_drawer.dart';

import '../../utils/colors.dart';

class ProductDetailPage extends StatefulWidget {
  ProductDetailPage({Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

const List<String> country = ["BD", "US", "BD", "US", "BD"];

class _ProductDetailPageState extends State<ProductDetailPage> {
  var _currentPageValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(),
      // drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 60,
                  ),
                  Center(
                    child: Text(
                      "Product Details",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.edit_note,
                        color: MyColors.blue,
                      ),
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Get.find<ProductController>()
                          .selectedProduct
                          .value
                          .photos!
                          .length ==
                      0
                  ? Container(
                      height: 148,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                          child:
                              //Obx(
                              //    (() {
                              //   return Get.find<HomeController>().offers.length > 0
                              //     ?
                              CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: ((index, reason) {
                            setState(() {
                              _currentPageValue = index.toDouble();
                            });
                          }),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                        ),
                        items: country
                            .map((item) => Container(
                                  margin: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width / .7,
                                  height: Get.height / 5.0632,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image:
                                              AssetImage("assets/iphone.png"))),
                                ))
                            .toList(),
                      )
                          //                         : Container();
                          //   }),
                          //    ),
                          ),
                    )
                  : Container(
                      height: 148,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                          child:
                              //Obx(
                              //    (() {
                              //   return Get.find<HomeController>().offers.length > 0
                              //     ?
                              CarouselSlider(
                        options: CarouselOptions(
                          onPageChanged: ((index, reason) {
                            setState(() {
                              _currentPageValue = index.toDouble();
                            });
                          }),
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 1,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 2000),
                        ),
                        items: Get.find<ProductController>()
                            .selectedProduct
                            .value
                            .photos!
                            .map((item) => Container(
                                  margin: EdgeInsets.all(5),
                                  width: MediaQuery.of(context).size.width / .7,
                                  height: Get.height / 6.0632,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              item.photo.toString()))),
                                ))
                            .toList(),
                      )
                          //                         : Container();
                          //   }),
                          //    ),
                          ),
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          //Obx(
                          // (() =>
                          Get.find<ProductController>()
                                      .selectedProduct
                                      .value
                                      .photos!
                                      .length >
                                  0
                              ? DotsIndicator(
                                  dotsCount: Get.find<ProductController>()
                                      .selectedProduct
                                      .value
                                      .photos!
                                      .length,
                                  position: _currentPageValue,
                                  decorator: const DotsDecorator(
                                    color: Colors.black, // Inactive color
                                    activeColor: Colors.white,
                                  ),
                                )
                              : DotsIndicator(
                                  dotsCount: 5,
                                  position: _currentPageValue,
                                  decorator: const DotsDecorator(
                                    color: Colors.black, // Inactive color
                                    activeColor: Colors.white,
                                  ),
                                )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Sku",
                        style: TextStyle(
                            color: MyColors.ash,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Get.find<ProductController>()
                            .selectedProduct
                            .value
                            .sku
                            .toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Product Stock",
                        style: TextStyle(
                            color: MyColors.ash,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Get.find<ProductController>()
                            .selectedProduct
                            .value
                            .minQty
                            .toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Name",
                        style: TextStyle(
                            color: MyColors.ash,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        Get.find<ProductController>()
                            .selectedProduct
                            .value
                            .name
                            .toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Product Variants",
                        style: TextStyle(
                            color: MyColors.ash,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Product Description",
                style: TextStyle(
                    color: MyColors.ash,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                Get.find<ProductController>()
                    .selectedProduct
                    .value
                    .description
                    .toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Product Price",
                style: TextStyle(
                    color: MyColors.ash,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "\$${Get.find<ProductController>().selectedProduct.value.salePrice.toString()}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Product Active?",
                style: TextStyle(
                    color: MyColors.ash,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "No",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
