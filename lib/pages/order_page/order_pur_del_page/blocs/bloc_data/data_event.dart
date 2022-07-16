part of 'data_bloc.dart';
class OrderDataEvent extends Equatable {
  const OrderDataEvent({
    this.price,
    this.additionalServices,
    this.link,


  });
  final String? price;
  final String? additionalServices;
  final String? link;



  @override
  // TODO: implement props
  List<Object?> get props => [
    price,
    additionalServices,
    link

  ];
}