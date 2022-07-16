part of 'data_bloc.dart';

@immutable
class OrderDataState extends Equatable {
  const OrderDataState({
    this.price,
    this.additionalServices,
    this.link,

  });
  final String? price;
  final String? additionalServices;
  final String? link;

  OrderDataState copyWith({
    String? price,
    String? additionalServices,
    String? link,




  }) {
    return OrderDataState(
      price: price ?? this.price,
      additionalServices: additionalServices ?? this.additionalServices,
      link: link ?? this.link,




    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    price,
    additionalServices,
    link,
  ];
}