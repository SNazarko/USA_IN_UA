class GoodsModel {
  GoodsModel({
    this.goodsName,
    this.priceUA,
    this.priceUSA,
    this.goodsImage,
    this.webSite,
    this.category,
  });

  factory GoodsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return GoodsModel(
      goodsName: json['goodsName'],
      priceUA: json['priceUA'],
      priceUSA: json['priceUSA'],
      goodsImage: json['goodsImage'],
      webSite: json['webSite'],
      category: json['category'],
    );
  }
  String? goodsName;
  String? priceUA;
  String? priceUSA;
  String? goodsImage;
  String? webSite;
  List? category;

  Map<String, dynamic> toJson() => {
        'goodsName': goodsName,
        'priceUA': priceUA,
        'priceUSA': priceUSA,
        'goodsImage': goodsImage,
        'webSite': webSite,
        'category': category
      };
}
