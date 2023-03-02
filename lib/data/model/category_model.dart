class CategoryModel {
  int? categoryId;
  String? name;
  int? daysToReminderBeforeExpire;
  int? marketId;
  String? sellerId;
  Market? market;
  CategoryModel({this.categoryId, this.name, this.daysToReminderBeforeExpire, this.marketId, this.sellerId,this.market,});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'] as int;
    name = json['name'] as String;
    daysToReminderBeforeExpire = json['dayesToReminderBeforExpire'] as int;
    marketId = json['marketId'] as int;
    sellerId = json['sellerId'] as String ;
    market = json['market'] != null ?  Market.fromJson(json['market']) : null;
  }
}
class Market {
  int? id;
  String? name;
  String? sellerId;

  Market({this.id, this.name, this.sellerId});

  Market.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sellerId = json['sellerId'];
  }

}