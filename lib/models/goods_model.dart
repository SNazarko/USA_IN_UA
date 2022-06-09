class GoodsModel {
  GoodsModel({
    this.goodsName,
    this.priceUA,
    this.priceUSA,
    this.goodsImage,
  });

  factory GoodsModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return GoodsModel(
      goodsName: json['goodsName'],
      priceUA: json['priceUA'],
      priceUSA: json['priceUSA'],
      goodsImage: json['goodsImage'],
    );
  }
  String? goodsName;
  String? priceUA;
  String? priceUSA;
  String? goodsImage;

  Map<String, dynamic> toJson() => {
        'goodsName': goodsName,
        'priceUA': priceUA,
        'priceUSA': priceUSA,
        'goodsImage': goodsImage,
      };
}
