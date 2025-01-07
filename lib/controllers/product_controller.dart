import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:paikariwala_seller/model/brand.dart';
import 'package:paikariwala_seller/model/category.dart';
import 'package:paikariwala_seller/model/product.dart';
import 'package:paikariwala_seller/model/variant.dart';
import 'package:paikariwala_seller/service/product_service.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  var categoryId = ''.obs;
  var brandId = ''.obs;
  var pName = ''.obs;
  var pSku = ''.obs;
  var pStock = ''.obs;
  var pUnitType = ''.obs;
  var pDesc = ''.obs;
  var pCostPrice = ''.obs;
  var pSalePrice = ''.obs;
  var pDiscount = ''.obs;
  var selected = "Approved".obs;

  RxList<CategoryData> categoryList = <CategoryData>[].obs;
  RxList<BrandData> brandList = <BrandData>[].obs;
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> pendingProductList = <ProductModel>[].obs;
  RxList<ProductModel> declinedProductList = <ProductModel>[].obs;
  RxList<Variant> varientList = <Variant>[].obs;
  RxList<PickedFile> pickedFileList = <PickedFile>[].obs;
  Rx<ProductModel> selectedProduct = ProductModel().obs;

  clear() {
    varientList.clear();
    pickedFileList.clear();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    super.onClose();
  }

  getData() {
    getCategory();
    getBrand();
    getProducts();
  }

  getCategory() async {
    ProductService service = ProductService();
    await service.getCategory();
  }

  getProducts() async {
    ProductService service = ProductService();
    await service.getProducts();
  }

  getBrand() async {
    ProductService service = ProductService();
    await service.getBrand();
  }

  addProduct() async {
    var map = new Map<String, dynamic>();
    map['category_id'] = categoryId.value;
    map['brand_id'] = brandId.value;
    map['name'] = pName.value;
    map['description'] = pDesc.value;
    map['sku'] = pSku.value;
    map['unit_type'] = pUnitType.value;
    map['min_qty'] = pStock.value;
    map['cost_price'] = pCostPrice.value;
    map['sale_price'] = pSalePrice.value;
    map['discount'] = pDiscount.value;

    for (int i = 0; i < varientList.length; i++) {
      map['variants[$i][type]'] = varientList[i].type;
      map['variants[$i][name]'] = varientList[i].name;
      map['variants[$i][wgt]'] = varientList[i].wgt;
      map['variants[$i][wgt_unit]'] = varientList[i].wgtUnit;
      map['variants[$i][stock]'] = varientList[i].stock;
    }

    ProductService service = ProductService();
    return await service.addProduct(map);
  }
}
