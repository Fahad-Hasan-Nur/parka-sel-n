final baseUrlDev =
    "https://paikariwala-backend.coderslab.com.bd/api/v1/"; // XSERVER ip
final baseUrlProd = "";
const baseUrlLocal = "http://localhost:8000/api/v1/";
final baseUrl = baseUrlDev;
final loginApi = "${baseUrl}login";
final registerApi = "${baseUrl}seller/register";
final otpApi = "${baseUrl}otp";
final getCategoriesApi = "${baseUrl}seller/categories";
final getBrandApi = "${baseUrl}seller/brands";
final getProductApi = "${baseUrl}seller/products";
final addProductApi = "${baseUrl}seller/products";

final getOrderApi = "${baseUrl}seller/orders";
final getOrderDetailsApi = "${baseUrl}seller/order/orderDetail";

final updateOrderStatusApi = "${baseUrl}seller/status/orders";
