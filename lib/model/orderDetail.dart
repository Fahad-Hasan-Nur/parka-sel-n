class OrderDetailModel {
  int? _id;
  Product? _product;
  Variant? _variant;
  int? _qty;
  String? _unitPrice;
  String? _discount;
  String? _totalPrice;
  String? _deliveryCharge;
  String? _codCharges;
  List<ProductPhotos>? _productPhotos;

  OrderDetailModel(
      {int? id,
      Product? product,
      Variant? variant,
      int? qty,
      String? unitPrice,
      String? discount,
      String? totalPrice,
      String? deliveryCharge,
      String? codCharges,
      List<ProductPhotos>? productPhotos}) {
    if (id != null) {
      this._id = id;
    }
    if (product != null) {
      this._product = product;
    }
    if (variant != null) {
      this._variant = variant;
    }
    if (qty != null) {
      this._qty = qty;
    }
    if (unitPrice != null) {
      this._unitPrice = unitPrice;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (totalPrice != null) {
      this._totalPrice = totalPrice;
    }
    if (deliveryCharge != null) {
      this._deliveryCharge = deliveryCharge;
    }
    if (codCharges != null) {
      this._codCharges = codCharges;
    }
    if (productPhotos != null) {
      this._productPhotos = productPhotos;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Product? get product => _product;
  set product(Product? product) => _product = product;
  Variant? get variant => _variant;
  set variant(Variant? variant) => _variant = variant;
  int? get qty => _qty;
  set qty(int? qty) => _qty = qty;
  String? get unitPrice => _unitPrice;
  set unitPrice(String? unitPrice) => _unitPrice = unitPrice;
  String? get discount => _discount;
  set discount(String? discount) => _discount = discount;
  String? get totalPrice => _totalPrice;
  set totalPrice(String? totalPrice) => _totalPrice = totalPrice;
  String? get deliveryCharge => _deliveryCharge;
  set deliveryCharge(String? deliveryCharge) =>
      _deliveryCharge = deliveryCharge;
  String? get codCharges => _codCharges;
  set codCharges(String? codCharges) => _codCharges = codCharges;
  List<ProductPhotos>? get productPhotos => _productPhotos;
  set productPhotos(List<ProductPhotos>? productPhotos) =>
      _productPhotos = productPhotos;

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    _variant =
        json['variant'] != null ? new Variant.fromJson(json['variant']) : null;
    _qty = json['qty'];
    _unitPrice = json['unit_price'];
    _discount = json['discount'];
    _totalPrice = json['total_price'];
    _deliveryCharge = json['delivery_charge'];
    _codCharges = json['cod_charges'];
    if (json['product_photos'] != null) {
      _productPhotos = <ProductPhotos>[];
      json['product_photos'].forEach((v) {
        _productPhotos!.add(new ProductPhotos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._product != null) {
      data['product'] = this._product!.toJson();
    }
    if (this._variant != null) {
      data['variant'] = this._variant!.toJson();
    }
    data['qty'] = this._qty;
    data['unit_price'] = this._unitPrice;
    data['discount'] = this._discount;
    data['total_price'] = this._totalPrice;
    data['delivery_charge'] = this._deliveryCharge;
    data['cod_charges'] = this._codCharges;
    if (this._productPhotos != null) {
      data['product_photos'] =
          this._productPhotos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  int? _id;
  int? _categoryId;
  int? _brandId;
  String? _name;
  String? _description;
  String? _sku;
  String? _unitType;
  int? _minQty;
  String? _costPrice;
  String? _salePrice;
  String? _discount;
  String? _commission;
  String? _profit;
  int? _storeId;
  int? _sellerId;
  String? _status;
  int? _handledBy;
  String? _handledAt;
  String? _createdAt;
  String? _updatedAt;
  List<Photos>? _photos;

  Product(
      {int? id,
      int? categoryId,
      int? brandId,
      String? name,
      String? description,
      String? sku,
      String? unitType,
      int? minQty,
      String? costPrice,
      String? salePrice,
      String? discount,
      String? commission,
      String? profit,
      int? storeId,
      int? sellerId,
      String? status,
      int? handledBy,
      String? handledAt,
      String? createdAt,
      String? updatedAt,
      List<Photos>? photos}) {
    if (id != null) {
      this._id = id;
    }
    if (categoryId != null) {
      this._categoryId = categoryId;
    }
    if (brandId != null) {
      this._brandId = brandId;
    }
    if (name != null) {
      this._name = name;
    }
    if (description != null) {
      this._description = description;
    }
    if (sku != null) {
      this._sku = sku;
    }
    if (unitType != null) {
      this._unitType = unitType;
    }
    if (minQty != null) {
      this._minQty = minQty;
    }
    if (costPrice != null) {
      this._costPrice = costPrice;
    }
    if (salePrice != null) {
      this._salePrice = salePrice;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (commission != null) {
      this._commission = commission;
    }
    if (profit != null) {
      this._profit = profit;
    }
    if (storeId != null) {
      this._storeId = storeId;
    }
    if (sellerId != null) {
      this._sellerId = sellerId;
    }
    if (status != null) {
      this._status = status;
    }
    if (handledBy != null) {
      this._handledBy = handledBy;
    }
    if (handledAt != null) {
      this._handledAt = handledAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (photos != null) {
      this._photos = photos;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
  int? get brandId => _brandId;
  set brandId(int? brandId) => _brandId = brandId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get sku => _sku;
  set sku(String? sku) => _sku = sku;
  String? get unitType => _unitType;
  set unitType(String? unitType) => _unitType = unitType;
  int? get minQty => _minQty;
  set minQty(int? minQty) => _minQty = minQty;
  String? get costPrice => _costPrice;
  set costPrice(String? costPrice) => _costPrice = costPrice;
  String? get salePrice => _salePrice;
  set salePrice(String? salePrice) => _salePrice = salePrice;
  String? get discount => _discount;
  set discount(String? discount) => _discount = discount;
  String? get commission => _commission;
  set commission(String? commission) => _commission = commission;
  String? get profit => _profit;
  set profit(String? profit) => _profit = profit;
  int? get storeId => _storeId;
  set storeId(int? storeId) => _storeId = storeId;
  int? get sellerId => _sellerId;
  set sellerId(int? sellerId) => _sellerId = sellerId;
  String? get status => _status;
  set status(String? status) => _status = status;
  int? get handledBy => _handledBy;
  set handledBy(int? handledBy) => _handledBy = handledBy;
  String? get handledAt => _handledAt;
  set handledAt(String? handledAt) => _handledAt = handledAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  List<Photos>? get photos => _photos;
  set photos(List<Photos>? photos) => _photos = photos;

  Product.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryId = json['category_id'];
    _brandId = json['brand_id'];
    _name = json['name'];
    _description = json['description'];
    _sku = json['sku'];
    _unitType = json['unit_type'];
    _minQty = json['min_qty'];
    _costPrice = json['cost_price'];
    _salePrice = json['sale_price'];
    _discount = json['discount'];
    _commission = json['commission'];
    _profit = json['profit'];
    _storeId = json['store_id'];
    _sellerId = json['seller_id'];
    _status = json['status'];
    _handledBy = json['handled_by'];
    _handledAt = json['handled_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['photos'] != null) {
      _photos = <Photos>[];
      json['photos'].forEach((v) {
        _photos!.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category_id'] = this._categoryId;
    data['brand_id'] = this._brandId;
    data['name'] = this._name;
    data['description'] = this._description;
    data['sku'] = this._sku;
    data['unit_type'] = this._unitType;
    data['min_qty'] = this._minQty;
    data['cost_price'] = this._costPrice;
    data['sale_price'] = this._salePrice;
    data['discount'] = this._discount;
    data['commission'] = this._commission;
    data['profit'] = this._profit;
    data['store_id'] = this._storeId;
    data['seller_id'] = this._sellerId;
    data['status'] = this._status;
    data['handled_by'] = this._handledBy;
    data['handled_at'] = this._handledAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    if (this._photos != null) {
      data['photos'] = this._photos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int? _id;
  int? _productId;
  String? _ogName;
  String? _photo;
  String? _createdAt;
  String? _updatedAt;

  Photos(
      {int? id,
      int? productId,
      String? ogName,
      String? photo,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (ogName != null) {
      this._ogName = ogName;
    }
    if (photo != null) {
      this._photo = photo;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  String? get ogName => _ogName;
  set ogName(String? ogName) => _ogName = ogName;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Photos.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _ogName = json['og_name'];
    _photo = json['photo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['og_name'] = this._ogName;
    data['photo'] = this._photo;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Variant {
  int? _id;
  int? _productId;
  String? _type;
  String? _name;
  String? _wgt;
  String? _wgtUnit;
  int? _stock;
  String? _createdAt;
  String? _updatedAt;

  Variant(
      {int? id,
      int? productId,
      String? type,
      String? name,
      String? wgt,
      String? wgtUnit,
      int? stock,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (productId != null) {
      this._productId = productId;
    }
    if (type != null) {
      this._type = type;
    }
    if (name != null) {
      this._name = name;
    }
    if (wgt != null) {
      this._wgt = wgt;
    }
    if (wgtUnit != null) {
      this._wgtUnit = wgtUnit;
    }
    if (stock != null) {
      this._stock = stock;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get wgt => _wgt;
  set wgt(String? wgt) => _wgt = wgt;
  String? get wgtUnit => _wgtUnit;
  set wgtUnit(String? wgtUnit) => _wgtUnit = wgtUnit;
  int? get stock => _stock;
  set stock(int? stock) => _stock = stock;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Variant.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productId = json['product_id'];
    _type = json['type'];
    _name = json['name'];
    _wgt = json['wgt'];
    _wgtUnit = json['wgt_unit'];
    _stock = json['stock'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['product_id'] = this._productId;
    data['type'] = this._type;
    data['name'] = this._name;
    data['wgt'] = this._wgt;
    data['wgt_unit'] = this._wgtUnit;
    data['stock'] = this._stock;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class ProductPhotos {
  String? _ogName;
  String? _photo;

  ProductPhotos({String? ogName, String? photo}) {
    if (ogName != null) {
      this._ogName = ogName;
    }
    if (photo != null) {
      this._photo = photo;
    }
  }

  String? get ogName => _ogName;
  set ogName(String? ogName) => _ogName = ogName;
  String? get photo => _photo;
  set photo(String? photo) => _photo = photo;

  ProductPhotos.fromJson(Map<String, dynamic> json) {
    _ogName = json['og_name'];
    _photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['og_name'] = this._ogName;
    data['photo'] = this._photo;
    return data;
  }
}
