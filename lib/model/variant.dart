class Variant {
  String? _type;
  String? _name;
  String? _wgt;
  String? _wgtUnit;
  String? _stock;

  Variant(
      {String? type,
      String? name,
      String? wgt,
      String? wgtUnit,
      String? stock}) {
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
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get wgt => _wgt;
  set wgt(String? wgt) => _wgt = wgt;
  String? get wgtUnit => _wgtUnit;
  set wgtUnit(String? wgtUnit) => _wgtUnit = wgtUnit;
  String? get stock => _stock;
  set stock(String? stock) => _stock = stock;

  Variant.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _name = json['name'];
    _wgt = json['wgt'];
    _wgtUnit = json['wgt_unit'];
    _stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['name'] = this._name;
    data['wgt'] = this._wgt;
    data['wgt_unit'] = this._wgtUnit;
    data['stock'] = this._stock;
    return data;
  }
}
