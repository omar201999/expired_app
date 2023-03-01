class CategoryModel {
  int? categoryId;
  String? name;
  int? daysToReminderBeforeExpire;
  int? marketId;
  String? sellerId;

  CategoryModel({this.categoryId, this.name, this.daysToReminderBeforeExpire, this.marketId, this.sellerId});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'] as int;
    name = json['name'] as String;
    daysToReminderBeforeExpire = json['dayesToReminderBeforExpire'] as int;
    marketId = json['marketId'] as int;
    sellerId = json['sellerId'] as String ;
  }
}
