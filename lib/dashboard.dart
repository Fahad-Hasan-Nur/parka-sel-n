import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paikariwala_seller/controllers/order_controller.dart';
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/my_app_bar.dart';
import 'package:paikariwala_seller/pages/add_product/add_product.dart';
import 'package:paikariwala_seller/pages/product/product_page.dart';
import 'package:paikariwala_seller/pages/sales/sales_page.dart';
import 'package:paikariwala_seller/pages/home/home_page.dart';
import 'package:paikariwala_seller/pages/order/order_page.dart';

import 'controllers/home_controller.dart';
import 'my_drawer.dart';
import 'utils/colors.dart';

const List<TabItem> items = [
  TabItem(
    icon: Icons.home_outlined,
    title: 'Home',
  ),
  TabItem(
    icon: Icons.list_alt,
    title: 'Order',
  ),

  TabItem(
    icon: Icons.inbox,
    title: 'Product',
  ),
  // TabItem(
  //   icon: Icons.timeline,
  //   title: 'Future Trading',
  // ),
  TabItem(
    icon: Icons.real_estate_agent,
    title: 'Sales',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paikariwala Seller',
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          primarySwatch: Colors.blue,
          canvasColor: MyColors.white,
          primaryIconTheme: IconThemeData(color: MyColors.appColor)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Get.put(HomeController(), permanent: true);
    Get.put(ProductController(), permanent: true);
    Get.put(OrderController(), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Container(child: getBody()),
      ),
      appBar: CustomAppBar(),
      drawer: const MyDrawer(),
      floatingActionButton: Align(
        alignment: Alignment(1, 1.03),
        child: FloatingActionButton(
          onPressed: () {
            Get.to(AddProductPage());
          },
          backgroundColor: MyColors.appColor,
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomBarDefault(
        items: items,
        paddingVertical: 15,
        backgroundColor: MyColors.appColor,
        color: Color.fromARGB(255, 34, 72, 71),
        colorSelected: Colors.white,
        indexSelected: Get.find<HomeController>().currentIndex.value,
        // paddingVertical: 15,
        //  titleStyle: TextStyle(fontSize: 8),
        onTap: (int index) => setState(() {
          Get.find<HomeController>().currentIndex.value = index;
        }),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      OrderPage(),
      ProductPage(),
      SalesPage(),

      // FutureTrading(),
    ];
    return IndexedStack(
      index: Get.find<HomeController>().currentIndex.value,
      children: pages,
    );
  }
}
