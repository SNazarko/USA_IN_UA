class GoodsModel {
  GoodsModel({
    this.goodsName,
    this.priceUA,
    this.priceUSA,
    this.goodsImage,
    this.webSite,
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
    );
  }
  String? goodsName;
  String? priceUA;
  String? priceUSA;
  String? goodsImage;
  String? webSite;

  Map<String, dynamic> toJson() => {
        'goodsName': goodsName,
        'priceUA': priceUA,
        'priceUSA': priceUSA,
        'goodsImage': goodsImage,
        'webSite': webSite,
      };
}
