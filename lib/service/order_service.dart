import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paikariwala_seller/model/orderDetail.dart';

import '../controllers/order_controller.dart';
import '../model/order.dart';
import '../utils/api_list.dart';

class OrderService {
  Future<void> getOrders() async {
    var url = Uri.parse(getOrderApi);
    GetStorage box = GetStorage();
    print(box.read("access_token"));

    var response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read("access_token")}'
      },
    );

    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var product in jsonData) {
          if (product['status'] == 'pending') {
            Get.find<OrderController>()
                .pendingOrderList
                .add(OrderModel.fromJson(product));
          } else if (product['status'] == 'approved') {
            Get.find<OrderController>()
                .approvedOrderList
                .add(OrderModel.fromJson(product));
          } else if (product['status'] == 'processed') {
            Get.find<OrderController>()
                .processedOrderList
                .add(OrderModel.fromJson(product));
          } else if (product['status'] == 'canceled') {
            Get.find<OrderController>()
                .canceledOrderList
                .add(OrderModel.fromJson(product));
          } else if (product['status'] == 'delivered') {
            Get.find<OrderController>()
                .deliveredOrderList
                .add(OrderModel.fromJson(product));
          }
        }
      }
    } catch (exception) {}
  }

  Future<bool> updateOrderStatus(String id, var data) async {
    var url = Uri.parse(updateOrderStatusApi + '/' + id);
    GetStorage box = GetStorage();

    var response = await http.post(
      url,
      body: data,
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read("access_token")}'
      },
    );

    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        await Get.find<OrderController>().getOrders();
        Get.find<OrderController>().isLoadingSales.value = false;
        return true;
      } else {
        var jsonData = json.decode(response.body);
        Get.find<OrderController>().isLoadingSales.value = false;
        return false;
      }
    } catch (exception) {
      Get.find<OrderController>().isLoadingSales.value = false;
      var jsonData = json.decode(response.body);
      return false;
    }
  }

  Future<void> getOrderDetails(String id) async {
    var url = Uri.parse(getOrderDetailsApi + "/" + id);
    GetStorage box = GetStorage();

    var response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        'Authorization': 'Bearer ${box.read("access_token")}'
      },
    );

    try {
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        for (var product in jsonData) {
          Get.find<OrderController>()
              .orderDetailList
              .add(OrderDetailModel.fromJson(product));
        }
      }
    } catch (exception) {}
  }
}
