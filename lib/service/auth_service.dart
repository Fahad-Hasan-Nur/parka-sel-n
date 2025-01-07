import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paikariwala_seller/pages/auth/verification.dart';
import 'package:paikariwala_seller/utils/api_list.dart';

import '../controllers/auth_controller..dart';
import '../dashboard.dart';
import '../utils/colors.dart';

class AuthService {
  Future<void> authenticate(String phone, String otp) async {
    var url = Uri.parse(loginApi);

    var map = new Map<String, dynamic>();
    map['phone'] = '$phone';
    map['otp'] = '$otp';
    var response = await http.post(
      url,
      body: map,
    );

    try {
      if (response.statusCode == 200) {
        Get.find<AuthController>().isLoading.value = false;

        var jsonData = json.decode(response.body);

        final box = GetStorage();
        box.write('access_token', jsonData["token"]);
        print(jsonData["token"]);
        // box.write('userId', jsonData["data"]["userId"]);
        // box.write('email', jsonData["data"]["email"]);
        // box.write('profileImgagePath', jsonData["data"]["profileImgagePath"]);
        // await Get.find<WalletController>().getData();
        // await Get.find<HomeController>()
        //     .getData()
        //     .then((value) => Get.offAll(MyApp()));
        Get.offAll(MyApp());
      } else {
        var jsonData = json.decode(response.body);
        Get.find<AuthController>().isLoading.value = false;

        Get.snackbar(" Error", "OTP does not match",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.blue);
      }
    } catch (exception) {
      Get.find<AuthController>().isLoading.value = false;

      Get.snackbar(" Error", "Something went wrong",
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: MyColors.blue);
    }
  }

  Future<void> login(String phone) async {
    var url = Uri.parse(otpApi);

    var map = new Map<String, dynamic>();
    map['phone'] = '$phone';
    var response = await http.post(
      url,
      body: map,
    );

    try {
      if (response.statusCode == 200) {
        Get.find<AuthController>().isLoading.value = false;
        Get.to(VerficationPage());
      } else {
        Get.find<AuthController>().isLoading.value = false;

        Get.snackbar(" Error", "Invalid phone number",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.blue);
      }
    } catch (exception) {
      Get.find<AuthController>().isLoading.value = false;

      Get.snackbar(" Error", response.body.toString(),
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: MyColors.blue);
    }
  }

  Future<bool> signUpUser() async {
    var url = Uri.parse(registerApi);

    final request = http.MultipartRequest('POST', url);
    request.headers.addAll({"Accept": "application/json"});

    request.fields['store_name'] = Get.find<AuthController>().sName.value;
    request.fields['address'] = Get.find<AuthController>().sAddress.value;
    request.fields['location'] = Get.find<AuthController>().sLoc.value;
    request.fields['owner_name'] = Get.find<AuthController>().name.value;
    request.fields['owner_phone'] = Get.find<AuthController>().phone.value;
    request.fields['owner_nid'] = Get.find<AuthController>().nid.value;
    request.fields['trade_license'] =
        Get.find<AuthController>().tradeLicenseNong.value;
    request.fields['bank_name'] = Get.find<AuthController>().bName.value;
    request.fields['bank_acct_number'] =
        Get.find<AuthController>().bAccountNong.value;
    request.fields['bank_branch'] = Get.find<AuthController>().branchName.value;
    request.fields['mfs_id'] = Get.find<AuthController>().mfsId.value;
    request.fields['mfs_number'] = Get.find<AuthController>().mfsNumner.value;
    request.fields['bank_acct_name'] =
        Get.find<AuthController>().bAccountNong.value;

    request.files.add(await http.MultipartFile.fromPath(
        "owner_nid_imgf", Get.find<AuthController>().nidFrontImg.value));
    request.files.add(await http.MultipartFile.fromPath(
        "owner_nid_imgb", Get.find<AuthController>().nidBackImg.value));
    request.files.add(await http.MultipartFile.fromPath(
        "trade_license_img", Get.find<AuthController>().tradeLicenseImg.value));

    try {
      final response = await request.send();
      var responsed = await http.Response.fromStream(response);
      final responsedData = json.decode(responsed.body);
      if (response.statusCode == 200) {
        Get.find<AuthController>().isLoading.value = false;
        return true;
      } else if (response.statusCode == 422) {
        Get.find<AuthController>().isLoading.value = false;
        Get.snackbar(" Error", responsedData["message"],
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.appColor);
        return false;
      } else {
        Get.find<AuthController>().isLoading.value = false;
        Get.snackbar(" Error", "Something went wrong",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.appColor);
        return false;
      }
    } catch (exception) {
      Get.find<AuthController>().isLoading.value = false;

      return false;
    }
  }
}
