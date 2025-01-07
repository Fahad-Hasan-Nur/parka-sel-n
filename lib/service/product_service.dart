import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paikariwala_seller/controllers/product_controller.dart';
import 'package:paikariwala_seller/model/brand.dart';
import 'package:paikariwala_seller/model/category.dart';
import 'package:paikariwala_seller/model/product.dart';
import 'package:paikariwala_seller/utils/api_list.dart';

import '../utils/colors.dart';

class ProductService {
  Future<void> getCategory() async {
    GetStorage box = GetStorage();

    var url = Uri.parse(getCategoriesApi);
    print(box.read("access_token"));
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read("access_token")}'
      },
    );
    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var product in jsonData) {
          Get.find<ProductController>()
              .categoryList
              .add(CategoryData.fromJson(product));
        }
      }
    } catch (exception) {}
  }

  Future<void> getBrand() async {
    GetStorage box = GetStorage();

    var url = Uri.parse(getBrandApi);
    //GetStorage box = GetStorage();
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read('access_token')}'
      },
    );
    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var product in jsonData) {
          Get.find<ProductController>()
              .brandList
              .add(BrandData.fromJson(product));
        }
      }
    } catch (exception) {}
  }

  Future<void> getProducts() async {
    GetStorage box = GetStorage();
    var url = Uri.parse(getProductApi);
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read('access_token')}'
      },
    );
    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var product in jsonData['data']) {
          if (product['status'] == "approved") {
            Get.find<ProductController>()
                .productList
                .add(ProductModel.fromJson(product));
          } else if (product['status'] == "pending") {
            Get.find<ProductController>()
                .pendingProductList
                .add(ProductModel.fromJson(product));
          } else if (product['status'] == "declined") {
            Get.find<ProductController>()
                .declinedProductList
                .add(ProductModel.fromJson(product));
          }
        }
      }
    } catch (exception) {
      print(exception);
    }
  }

  Future<bool> addProduct(var depositData) async {
    var url = Uri.parse(addProductApi);
    GetStorage box = GetStorage();

    final request = http.MultipartRequest('POST', url);
    request.headers.addAll({
      "Authorization": "Bearer ${box.read("access_token")}",
      "Accept": "application/json"
    });

    request.fields['category_id'] =
        Get.find<ProductController>().categoryId.value;
    request.fields['brand_id'] = Get.find<ProductController>().brandId.value;
    request.fields['name'] = Get.find<ProductController>().pName.value;
    request.fields['description'] = Get.find<ProductController>().pDesc.value;
    request.fields['sku'] = Get.find<ProductController>().pSku.value;
    request.fields['unit_type'] = Get.find<ProductController>().pUnitType.value;
    request.fields['min_qty'] = Get.find<ProductController>().pStock.value;
    request.fields['cost_price'] =
        Get.find<ProductController>().pCostPrice.value;
    request.fields['sale_price'] =
        Get.find<ProductController>().pSalePrice.value;
    request.fields['discount'] = Get.find<ProductController>().pDiscount.value;

    for (int i = 0; i < Get.find<ProductController>().varientList.length; i++) {
      request.fields['variants[$i][type]'] =
          Get.find<ProductController>().varientList[i].type.toString();
      request.fields['variants[$i][name]'] =
          Get.find<ProductController>().varientList[i].name.toString();
      request.fields['variants[$i][wgt]'] =
          Get.find<ProductController>().varientList[i].wgt.toString();
      request.fields['variants[$i][wgt_unit]'] =
          Get.find<ProductController>().varientList[i].wgtUnit.toString();
      request.fields['variants[$i][stock]'] =
          Get.find<ProductController>().varientList[i].stock.toString();
    }

    for (int i = 0;
        i < Get.find<ProductController>().pickedFileList.length;
        i++) {
      request.files.add(await http.MultipartFile.fromPath(
          "photos[$i]", Get.find<ProductController>().pickedFileList[i].path));
    }

    final response = await request.send();
    var responsed = await http.Response.fromStream(response);
    final responsedData = json.decode(responsed.body);
    try {
      if (response.statusCode == 200) {
        Get.find<ProductController>().clear();
        Get.find<ProductController>().isLoading.value = false;
        return true;
      } else if (responsedData["message"].contains("products_sku_unique")) {
        Get.find<ProductController>().isLoading.value = false;
        Get.snackbar(" Error", "Product SKU should be unique..",
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.appColor);
        return false;
      } else {
        Get.find<ProductController>().isLoading.value = false;
        Get.snackbar(" Error", responsedData["message"],
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.white,
            backgroundColor: MyColors.appColor);
        return false;
      }
    } catch (exception) {
      Get.find<ProductController>().isLoading.value = false;

      return false;
    }
  }
}
