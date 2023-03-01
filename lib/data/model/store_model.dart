
class StoreModel {
  int? id;
  String? name;
  String? sellerId;

  StoreModel({this.id, this.name, this.sellerId});

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    sellerId = json['sellerId'] as String;
  }
/*  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sellerId'] = sellerId;
    return data;
  }*/
}




