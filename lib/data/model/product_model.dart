class ProductModel {
  int? productId;
  String? productName;
  String? barCode;
  num? price;
  String? currencyCode;
  num? quantity;
  String? createdAt;
  String? expireData;
  int? daysToReminderBeforeExpire;
  int? categoryId;
  int? marketId;
  String? sellerId;
  Category? category;
  Market? market;

  ProductModel({ this.market, this.category,this.productId, this.productName, this.barCode, this.price, this.currencyCode, this.quantity, this.createdAt, this.expireData, this.daysToReminderBeforeExpire, this.categoryId, this.marketId, this.sellerId});
  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['id'];
    productName = json['name'];
    barCode = json['barCode'];
    price = json['price'] as num ;
    currencyCode = json['currencyCode'];
    quantity = json['quantity'] as num ;
    createdAt = json['createdAt'];
    expireData = json['expireData'];
    daysToReminderBeforeExpire = json['dayesToReminderBeforExpire'];
    categoryId = json['categoryId'];
    marketId = json['marketId'];
    sellerId = json['sellerId'];
    category = json['category'] != null ?  Category.fromJson(json['category']) : null;
    market = json['market'] != null ?  Market.fromJson(json['market']) : null;
  }
  Map<String, dynamic> toJsonForAdd() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = productName;
    data['barCode'] = barCode;
    data['price'] = price;
    data['currencyCode'] = currencyCode;
    data['quantity'] = quantity;
    data['expireData'] = expireData;
    data['dayesToReminderBeforExpire'] = daysToReminderBeforeExpire;
    data['categoryId'] = categoryId;
    data['marketId'] = marketId;
    data['sellerId'] = sellerId;
    return data;
  }
  Map<String, dynamic> toJsonForEdit() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = productId;
    data['name'] = productName;
    data['barCode'] = barCode;
    data['price'] = price;
    data['currencyCode'] = currencyCode;
    data['quantity'] = quantity;
    data['createdAt'] = createdAt;
    data['expireData'] = expireData;
    data['dayesToReminderBeforExpire'] = daysToReminderBeforeExpire;
    data['categoryId'] = categoryId;
    data['marketId'] = marketId;
    data['sellerId'] = sellerId;
    return data;
  }

}


class Category {
  String? name;
  Category({this.name,});
  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
  }

}

class Market {

  String? name;
  Market({this.name});
  Market.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
  }

}

