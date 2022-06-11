import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../blocs/goods_list_bloc/goods_list_bloc.dart';
import '../../../blocs/goods_list_bloc/goods_list_state.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import 'back_and_forth_button.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListItemBloc, ListItemState>(
      builder: (context, state) {
        if (state.status == ListItemStatus.success) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.list.length,
                  itemBuilder: (BuildContext context, int index) {
                    final audio = state.list[index];
                    return _ListGoods(
                      goodsName: audio.goodsName,
                      priceUA: audio.priceUA,
                      priceUSA: audio.priceUSA,
                      goodsImage: audio.goodsImage,
                      state: state,
                      index: index,
                      controller: _controller,
                    );
                  },
                ),
              ),
              const Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        'Срок доставки примерно 10 дней',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: BackAndForthButton(
                  screen2: true,
                  controller: controller,
                ),
              ),
            ],
          );
        }
        if (state.status == ListItemStatus.initial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.status == ListItemStatus.failed) {
          return const Center(
            child: Text('Ошыбка'),
          );
        } else {
          return const Text('data');
        }
      },
    );
  }
}

class _ListGoods extends StatelessWidget {
  const _ListGoods({
    Key? key,
    this.goodsName,
    this.priceUA,
    this.priceUSA,
    this.goodsImage,
    required this.state,
    required this.index,
    required this.controller,
  }) : super(key: key);
  final String? goodsName;
  final String? priceUA;
  final String? priceUSA;
  final String? goodsImage;
  final ListItemState state;
  final int index;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: Column(
        children: [
          Flexible(
            flex: 5,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 20.0,
                ),
                child: SizedBox(
                  width: screenSize.width,
                  child: Image.network(
                    goodsImage!,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: state.list[index] == state.list.first
                              ? const SizedBox.shrink()
                              : InkWell(
                                  onTap: () => controller
                                      .jumpTo(controller.offset - 360.0),
                                  child: SvgPicture.asset(
                                    AppIcons.arrowLeft,
                                    color: AppColors.text,
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                        ),
                        Flexible(
                          flex: 5,
                          child: Text(
                            goodsName!,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: state.list[index] == state.list.last
                              ? const SizedBox.shrink()
                              : InkWell(
                                  onTap: () => controller
                                      .jumpTo(controller.offset + 360.0),
                                  child: SvgPicture.asset(
                                    AppIcons.arrowRight,
                                    color: AppColors.text,
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Цена в Украине',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    priceUA!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.attach_money,
                                    size: 20.0,
                                    color: AppColors.text,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Цена в США',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    priceUSA!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.attach_money,
                                    size: 20.0,
                                    color: AppColors.text,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Экономия',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            '${int.parse(priceUA!) - int.parse(priceUSA!)}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.green,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            Icons.attach_money_rounded,
                            size: 30.0,
                            color: AppColors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
