import 'package:get/get.dart';

import '../model/order.dart';
import '../model/orderDetail.dart';
import '../service/order_service.dart';

class OrderController extends GetxController {
  List<OrderModel> pendingOrderList = <OrderModel>[].obs;
  List<OrderModel> approvedOrderList = <OrderModel>[].obs;
  List<OrderModel> processedOrderList = <OrderModel>[].obs;
  List<OrderModel> deliveredOrderList = <OrderModel>[].obs;
  List<OrderModel> canceledOrderList = <OrderModel>[].obs;
  List<OrderDetailModel> orderDetailList = <OrderDetailModel>[].obs;
  Rx<OrderModel> detailOrder = OrderModel().obs;

  var selected = 'Processed'.obs;

  RxBool isLoadingSales = false.obs;

  @override
  onInit() async {
    super.onInit();
    getData();
  }

  getData() {
    getOrders();
  }

  clearData() {
    pendingOrderList.clear();
    approvedOrderList.clear();
    processedOrderList.clear();
    deliveredOrderList.clear();
    canceledOrderList.clear();
  }

  Future<void> getOrders() async {
    pendingOrderList.clear();
    approvedOrderList.clear();
    processedOrderList.clear();
    deliveredOrderList.clear();
    canceledOrderList.clear();

    OrderService service = OrderService();
    await service.getOrders();
  }

  Future<bool> updateOrderStatus(String id, var data) async {
    OrderService service = OrderService();
    return await service.updateOrderStatus(id, data);
  }

  Future<void> getOrderDetails(String id) async {
    orderDetailList.clear();
    OrderService service = OrderService();
    await service.getOrderDetails(id);
  }
}
