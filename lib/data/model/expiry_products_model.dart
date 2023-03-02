class ExpiryProductsModel {
  int? id;
  String? name;
  String? barCode;
  String? expireData;
  num? timeToExpire;

  ExpiryProductsModel({this.id, this.name, this.barCode, this.expireData, this.timeToExpire});

  ExpiryProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    name = json['name'] as String;
    barCode = json['barCode'] as String;
    expireData = json['expireData'] as String ;
    timeToExpire = json['timeToExpire'] as num;
  }

}