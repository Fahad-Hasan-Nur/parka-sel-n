class ProductModel {
  int? _id;
  Category? _category;
  Brand? _brand;
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
  List<Variants>? _variants;
  List<Photos>? _photos;
  String? _status;
  Store? _store;
  Seller? _seller;
  String? _handledAt;
  String? _handledBy;

  ProductModel(
      {int? id,
      Category? category,
      Brand? brand,
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
      List<Variants>? variants,
      List<Photos>? photos,
      String? status,
      Store? store,
      Seller? seller,
      String? handledAt,
      String? handledBy}) {
    if (id != null) {
      this._id = id;
    }
    if (category != null) {
      this._category = category;
    }
    if (brand != null) {
      this._brand = brand;
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
    if (variants != null) {
      this._variants = variants;
    }
    if (photos != null) {
      this._photos = photos;
    }
    if (status != null) {
      this._status = status;
    }
    if (store != null) {
      this._store = store;
    }
    if (seller != null) {
      this._seller = seller;
    }
    if (handledAt != null) {
      this._handledAt = handledAt;
    }
    if (handledBy != null) {
      this._handledBy = handledBy;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  Category? get category => _category;
  set category(Category? category) => _category = category;
  Brand? get brand => _brand;
  set brand(Brand? brand) => _brand = brand;
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
  List<Variants>? get variants => _variants;
  set variants(List<Variants>? variants) => _variants = variants;
  List<Photos>? get photos => _photos;
  set photos(List<Photos>? photos) => _photos = photos;
  String? get status => _status;
  set status(String? status) => _status = status;
  Store? get store => _store;
  set store(Store? store) => _store = store;
  Seller? get seller => _seller;
  set seller(Seller? seller) => _seller = seller;
  String? get handledAt => _handledAt;
  set handledAt(String? handledAt) => _handledAt = handledAt;
  String? get handledBy => _handledBy;
  set handledBy(String? handledBy) => _handledBy = handledBy;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    _brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
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
    if (json['variants'] != null) {
      _variants = <Variants>[];
      json['variants'].forEach((v) {
        _variants!.add(new Variants.fromJson(v));
      });
    }
    if (json['photos'] != null) {
      _photos = <Photos>[];
      json['photos'].forEach((v) {
        _photos!.add(new Photos.fromJson(v));
      });
    }
    _status = json['status'];
    _store = json['store'] != null ? new Store.fromJson(json['store']) : null;
    _seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    _handledAt = json['handled_at'];
    _handledBy = json['handled_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._category != null) {
      data['category'] = this._category!.toJson();
    }
    if (this._brand != null) {
      data['brand'] = this._brand!.toJson();
    }
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
    if (this._variants != null) {
      data['variants'] = this._variants!.map((v) => v.toJson()).toList();
    }
    if (this._photos != null) {
      data['photos'] = this._photos!.map((v) => v.toJson()).toList();
    }
    data['status'] = this._status;
    if (this._store != null) {
      data['store'] = this._store!.toJson();
    }
    if (this._seller != null) {
      data['seller'] = this._seller!.toJson();
    }
    data['handled_at'] = this._handledAt;
    data['handled_by'] = this._handledBy;
    return data;
  }
}

class Category {
  int? _id;
  String? _name;
  String? _icon;
  String? _commission;
  String? _parentId;
  String? _createdAt;
  String? _updatedAt;

  Category(
      {int? id,
      String? name,
      String? icon,
      String? commission,
      String? parentId,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (commission != null) {
      this._commission = commission;
    }
    if (parentId != null) {
      this._parentId = parentId;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get commission => _commission;
  set commission(String? commission) => _commission = commission;
  String? get parentId => _parentId;
  set parentId(String? parentId) => _parentId = parentId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Category.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _icon = json['icon'];
    _commission = json['commission'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['icon'] = this._icon;
    data['commission'] = this._commission;
    data['parent_id'] = this._parentId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Brand {
  int? _id;
  String? _name;
  String? _icon;
  String? _parentId;
  String? _createdAt;
  String? _updatedAt;

  Brand(
      {int? id,
      String? name,
      String? icon,
      String? parentId,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (icon != null) {
      this._icon = icon;
    }
    if (parentId != null) {
      this._parentId = parentId;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get icon => _icon;
  set icon(String? icon) => _icon = icon;
  String? get parentId => _parentId;
  set parentId(String? parentId) => _parentId = parentId;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Brand.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _icon = json['icon'];
    _parentId = json['parent_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['icon'] = this._icon;
    data['parent_id'] = this._parentId;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Variants {
  int? _id;
  int? _productId;
  String? _type;
  String? _name;
  String? _wgt;
  String? _wgtUnit;
  int? _stock;
  String? _createdAt;
  String? _updatedAt;

  Variants(
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

  Variants.fromJson(Map<String, dynamic> json) {
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

class Photos {
  String? _ogName;
  String? _photo;

  Photos({String? ogName, String? photo}) {
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

  Photos.fromJson(Map<String, dynamic> json) {
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

class Store {
  int? _id;
  String? _name;
  String? _logo;
  String? _address;
  String? _location;
  int? _sellerId;
  String? _sellerName;
  String? _sellerPhone;
  String? _sellerNid;
  String? _sellerNidImgf;
  String? _sellerNidImgb;
  String? _tradeLicense;
  String? _tradeLicenseImg;
  String? _bankName;
  String? _bankAcctNumber;
  String? _bankAcctName;
  String? _bankBranch;
  int? _mfsId;
  String? _mfsNumber;
  int? _approvedBy;
  String? _approvedAt;
  String? _createdAt;
  String? _updatedAt;

  Store(
      {int? id,
      String? name,
      String? logo,
      String? address,
      String? location,
      int? sellerId,
      String? sellerName,
      String? sellerPhone,
      String? sellerNid,
      String? sellerNidImgf,
      String? sellerNidImgb,
      String? tradeLicense,
      String? tradeLicenseImg,
      String? bankName,
      String? bankAcctNumber,
      String? bankAcctName,
      String? bankBranch,
      int? mfsId,
      String? mfsNumber,
      int? approvedBy,
      String? approvedAt,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (logo != null) {
      this._logo = logo;
    }
    if (address != null) {
      this._address = address;
    }
    if (location != null) {
      this._location = location;
    }
    if (sellerId != null) {
      this._sellerId = sellerId;
    }
    if (sellerName != null) {
      this._sellerName = sellerName;
    }
    if (sellerPhone != null) {
      this._sellerPhone = sellerPhone;
    }
    if (sellerNid != null) {
      this._sellerNid = sellerNid;
    }
    if (sellerNidImgf != null) {
      this._sellerNidImgf = sellerNidImgf;
    }
    if (sellerNidImgb != null) {
      this._sellerNidImgb = sellerNidImgb;
    }
    if (tradeLicense != null) {
      this._tradeLicense = tradeLicense;
    }
    if (tradeLicenseImg != null) {
      this._tradeLicenseImg = tradeLicenseImg;
    }
    if (bankName != null) {
      this._bankName = bankName;
    }
    if (bankAcctNumber != null) {
      this._bankAcctNumber = bankAcctNumber;
    }
    if (bankAcctName != null) {
      this._bankAcctName = bankAcctName;
    }
    if (bankBranch != null) {
      this._bankBranch = bankBranch;
    }
    if (mfsId != null) {
      this._mfsId = mfsId;
    }
    if (mfsNumber != null) {
      this._mfsNumber = mfsNumber;
    }
    if (approvedBy != null) {
      this._approvedBy = approvedBy;
    }
    if (approvedAt != null) {
      this._approvedAt = approvedAt;
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
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get logo => _logo;
  set logo(String? logo) => _logo = logo;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get location => _location;
  set location(String? location) => _location = location;
  int? get sellerId => _sellerId;
  set sellerId(int? sellerId) => _sellerId = sellerId;
  String? get sellerName => _sellerName;
  set sellerName(String? sellerName) => _sellerName = sellerName;
  String? get sellerPhone => _sellerPhone;
  set sellerPhone(String? sellerPhone) => _sellerPhone = sellerPhone;
  String? get sellerNid => _sellerNid;
  set sellerNid(String? sellerNid) => _sellerNid = sellerNid;
  String? get sellerNidImgf => _sellerNidImgf;
  set sellerNidImgf(String? sellerNidImgf) => _sellerNidImgf = sellerNidImgf;
  String? get sellerNidImgb => _sellerNidImgb;
  set sellerNidImgb(String? sellerNidImgb) => _sellerNidImgb = sellerNidImgb;
  String? get tradeLicense => _tradeLicense;
  set tradeLicense(String? tradeLicense) => _tradeLicense = tradeLicense;
  String? get tradeLicenseImg => _tradeLicenseImg;
  set tradeLicenseImg(String? tradeLicenseImg) =>
      _tradeLicenseImg = tradeLicenseImg;
  String? get bankName => _bankName;
  set bankName(String? bankName) => _bankName = bankName;
  String? get bankAcctNumber => _bankAcctNumber;
  set bankAcctNumber(String? bankAcctNumber) =>
      _bankAcctNumber = bankAcctNumber;
  String? get bankAcctName => _bankAcctName;
  set bankAcctName(String? bankAcctName) => _bankAcctName = bankAcctName;
  String? get bankBranch => _bankBranch;
  set bankBranch(String? bankBranch) => _bankBranch = bankBranch;
  int? get mfsId => _mfsId;
  set mfsId(int? mfsId) => _mfsId = mfsId;
  String? get mfsNumber => _mfsNumber;
  set mfsNumber(String? mfsNumber) => _mfsNumber = mfsNumber;
  int? get approvedBy => _approvedBy;
  set approvedBy(int? approvedBy) => _approvedBy = approvedBy;
  String? get approvedAt => _approvedAt;
  set approvedAt(String? approvedAt) => _approvedAt = approvedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Store.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _logo = json['logo'];
    _address = json['address'];
    _location = json['location'];
    _sellerId = json['seller_id'];
    _sellerName = json['seller_name'];
    _sellerPhone = json['seller_phone'];
    _sellerNid = json['seller_nid'];
    _sellerNidImgf = json['seller_nid_imgf'];
    _sellerNidImgb = json['seller_nid_imgb'];
    _tradeLicense = json['trade_license'];
    _tradeLicenseImg = json['trade_license_img'];
    _bankName = json['bank_name'];
    _bankAcctNumber = json['bank_acct_number'];
    _bankAcctName = json['bank_acct_name'];
    _bankBranch = json['bank_branch'];
    _mfsId = json['mfs_id'];
    _mfsNumber = json['mfs_number'];
    _approvedBy = json['approved_by'];
    _approvedAt = json['approved_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['logo'] = this._logo;
    data['address'] = this._address;
    data['location'] = this._location;
    data['seller_id'] = this._sellerId;
    data['seller_name'] = this._sellerName;
    data['seller_phone'] = this._sellerPhone;
    data['seller_nid'] = this._sellerNid;
    data['seller_nid_imgf'] = this._sellerNidImgf;
    data['seller_nid_imgb'] = this._sellerNidImgb;
    data['trade_license'] = this._tradeLicense;
    data['trade_license_img'] = this._tradeLicenseImg;
    data['bank_name'] = this._bankName;
    data['bank_acct_number'] = this._bankAcctNumber;
    data['bank_acct_name'] = this._bankAcctName;
    data['bank_branch'] = this._bankBranch;
    data['mfs_id'] = this._mfsId;
    data['mfs_number'] = this._mfsNumber;
    data['approved_by'] = this._approvedBy;
    data['approved_at'] = this._approvedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}

class Seller {
  int? _id;
  String? _sid;
  String? _name;
  String? _phone;
  String? _email;
  String? _image;
  String? _userType;
  String? _createdAt;
  String? _updatedAt;

  Seller(
      {int? id,
      String? sid,
      String? name,
      String? phone,
      String? email,
      String? image,
      String? userType,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (sid != null) {
      this._sid = sid;
    }
    if (name != null) {
      this._name = name;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (email != null) {
      this._email = email;
    }
    if (image != null) {
      this._image = image;
    }
    if (userType != null) {
      this._userType = userType;
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
  String? get sid => _sid;
  set sid(String? sid) => _sid = sid;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get image => _image;
  set image(String? image) => _image = image;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Seller.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _sid = json['sid'];
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _image = json['image'];
    _userType = json['user_type'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['sid'] = this._sid;
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['image'] = this._image;
    data['user_type'] = this._userType;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
