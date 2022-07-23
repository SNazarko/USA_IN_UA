
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
    this.image,
    this.track,
    this.status,
    this.imageGoods,
    this.statusItem,
    this.statusGoods,

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
      track: json['track'],
      isSwish: json['isSwish'],
      image: json['image'],
      status: json['status'],
      imageGoods: json['imageGoods'],
      statusItem: json['statusItem'],
      statusGoods: json['statusGoods'],

    );
  }
  String? id;
  String? link;
  String? quality;
  String? price;
  String? weight;
  String? additionalServices;
  String? details;
  String? track;
  bool? isSwish;
  String? image;
  String? imageGoods;
  String? status;
  List? statusItem;
  List? statusGoods;


  Map<String, dynamic> toJson() => {
    'id': id,
    'link': link,
    'quality': quality,
    'price': price,
    'weight': weight,
    'additionalServices': additionalServices,
    'details': details,
    'isSwish': isSwish,
    'image': image,
    'status': status,
    'imageGoods': imageGoods,
    'statusItem': statusItem,
    'statusGoods': statusGoods,
    'track': track

  };
}
