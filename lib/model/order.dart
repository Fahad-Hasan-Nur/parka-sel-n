class OrderModel {
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _addressLine1;
  String? _addressLine2;
  String? _city;
  String? _postalCode;
  String? _discount;
  String? _totalPrice;
  String? _totalDeliveryCharge;
  String? _subTotal;
  String? _status;

  OrderModel(
      {int? id,
      String? firstName,
      String? lastName,
      String? email,
      String? addressLine1,
      String? addressLine2,
      String? city,
      String? postalCode,
      String? discount,
      String? totalPrice,
      String? totalDeliveryCharge,
      String? subTotal,
      String? status}) {
    if (id != null) {
      this._id = id;
    }
    if (firstName != null) {
      this._firstName = firstName;
    }
    if (lastName != null) {
      this._lastName = lastName;
    }
    if (email != null) {
      this._email = email;
    }
    if (addressLine1 != null) {
      this._addressLine1 = addressLine1;
    }
    if (addressLine2 != null) {
      this._addressLine2 = addressLine2;
    }
    if (city != null) {
      this._city = city;
    }
    if (postalCode != null) {
      this._postalCode = postalCode;
    }
    if (discount != null) {
      this._discount = discount;
    }
    if (totalPrice != null) {
      this._totalPrice = totalPrice;
    }
    if (totalDeliveryCharge != null) {
      this._totalDeliveryCharge = totalDeliveryCharge;
    }
    if (subTotal != null) {
      this._subTotal = subTotal;
    }
    if (status != null) {
      this._status = status;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get firstName => _firstName;
  set firstName(String? firstName) => _firstName = firstName;
  String? get lastName => _lastName;
  set lastName(String? lastName) => _lastName = lastName;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get addressLine1 => _addressLine1;
  set addressLine1(String? addressLine1) => _addressLine1 = addressLine1;
  String? get addressLine2 => _addressLine2;
  set addressLine2(String? addressLine2) => _addressLine2 = addressLine2;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get postalCode => _postalCode;
  set postalCode(String? postalCode) => _postalCode = postalCode;
  String? get discount => _discount;
  set discount(String? discount) => _discount = discount;
  String? get totalPrice => _totalPrice;
  set totalPrice(String? totalPrice) => _totalPrice = totalPrice;
  String? get totalDeliveryCharge => _totalDeliveryCharge;
  set totalDeliveryCharge(String? totalDeliveryCharge) =>
      _totalDeliveryCharge = totalDeliveryCharge;
  String? get subTotal => _subTotal;
  set subTotal(String? subTotal) => _subTotal = subTotal;
  String? get status => _status;
  set status(String? status) => _status = status;

  OrderModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _city = json['city'];
    _postalCode = json['postal_code'];
    _discount = json['discount'];
    _totalPrice = json['total_price'];
    _totalDeliveryCharge = json['total_delivery_charge'];
    _subTotal = json['sub_total'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['email'] = this._email;
    data['address_line_1'] = this._addressLine1;
    data['address_line_2'] = this._addressLine2;
    data['city'] = this._city;
    data['postal_code'] = this._postalCode;
    data['discount'] = this._discount;
    data['total_price'] = this._totalPrice;
    data['total_delivery_charge'] = this._totalDeliveryCharge;
    data['sub_total'] = this._subTotal;
    data['status'] = this._status;
    return data;
  }
}
