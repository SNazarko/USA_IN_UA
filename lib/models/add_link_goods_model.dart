class AddLinkGoodsModel {
  AddLinkGoodsModel({
    this.id,
    this.link,
    this.quality,
    this.price,
    this.weight,
    this.additionalServices,
    this.details,
    this.isSwish,

  });

  factory AddLinkGoodsModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return AddLinkGoodsModel(
      id: json['id'],
      link: json['link'],
      quality: json['quality'],
      price: json['price'],
      weight: json['weight'],
      additionalServices: json['additionalServices'],
      details: json['details'],
      isSwish: json['isSwish'],

    );
  }
  String? id;
  String? link;
  String? quality;
  String? price;
  String? weight;
  String? additionalServices;
  String? details;
  bool? isSwish;


  Map<String, dynamic> toJson() => {
    'id': id,
    'link': link,
    'quality': quality,
    'price': price,
    'weight': weight,
    'additionalServices': additionalServices,
    'details': details,
    'isSwish': isSwish,

  };
}
