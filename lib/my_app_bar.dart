import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paikariwala_seller/pages/auth/sign_in.dart';
import 'package:paikariwala_seller/utils/colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key? key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      iconTheme: IconThemeData(color: MyColors.appColor),
      backgroundColor: MyColors.white,
      actions: [
        SizedBox(
          width: 10,
        ),
        PopupMenuButton(
          // 2
          icon: const Icon(Icons.sentiment_satisfied),

          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text(
                "Profile",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            const PopupMenuItem(
              child: Text(
                "Discount Management",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            const PopupMenuItem(
              child: Text(
                "Canceled Order List",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            const PopupMenuItem(
              child: Text(
                "Refunded Order List",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            const PopupMenuItem(
              child: Text(
                "Accounts",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            const PopupMenuItem(
              child: Text(
                "Reports",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            const PopupMenuItem(
              child: Text(
                "Terms & Conditions",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
            PopupMenuItem(
              onTap: (() {
                GetStorage box = GetStorage();
                box.remove("access_token");
                box.erase();
                Get.offAll(SignInPage());
              }),
              child: Text(
                "Log Out",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              // value: SortType.oldestFirst,
            ),
          ],
        ),
      ],
    );
  }
}
