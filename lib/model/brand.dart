class BrandData {
  int? _id;
  String? _name;

  BrandData({int? id, String? name}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;

  BrandData.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    return data;
  }
}
