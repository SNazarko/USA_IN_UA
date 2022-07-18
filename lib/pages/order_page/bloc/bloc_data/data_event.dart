part of 'data_bloc.dart';
class OrderDataEvent extends Equatable {
  const OrderDataEvent({
    this.price,
    this.additionalServices,
    this.link,
    this.isSwish,


  });
  final String? price;
  final String? additionalServices;
  final String? link;
  final bool? isSwish;



  @override
  // TODO: implement props
  List<Object?> get props => [
    price,
    additionalServices,
    link,
    isSwish

  ];
}