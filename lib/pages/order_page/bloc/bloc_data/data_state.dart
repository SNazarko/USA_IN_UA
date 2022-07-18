part of 'data_bloc.dart';

@immutable
class OrderDataState extends Equatable {
  const OrderDataState({
    this.price,
    this.additionalServices,
    this.link,
    this.isSwish,

  });
  final String? price;
  final String? additionalServices;
  final String? link;
  final bool? isSwish;

  OrderDataState copyWith({
    String? price,
    String? additionalServices,
    String? link,
    bool? isSwish,




  }) {
    return OrderDataState(
      price: price ?? this.price,
      additionalServices: additionalServices ?? this.additionalServices,
      link: link ?? this.link,
      isSwish: isSwish ?? this.isSwish,




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