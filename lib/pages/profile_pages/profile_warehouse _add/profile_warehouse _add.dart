import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import 'bloc_warehouse/bloc_warehouse_bloc.dart';

class ProfileWarehouseAddress extends StatelessWidget {
  const ProfileWarehouseAddress({Key? key}) : super(key: key);
  static const routeName = '/profile_warehouse _add';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WarehouseBloc>(
      create: (context) => WarehouseBloc()
        ..add(
          LoadLWarehouseEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                AppIcons.arrowLeft,
              ),
            ),
          ),
          title: const Text(
            'Адреса получателей',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: BlocBuilder<WarehouseBloc, WarehouseState>(
                  builder: (context, state) {
                    if (state.status == WarehouseStatus.success) {
                      return SizedBox(
                        width: double.infinity,
                        height: 420.0,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.list.length,
                          itemBuilder: (BuildContext context, int index) {
                            final data = state.list[index];
                            return _LinkModel(
                              street: data.street ?? '',
                              warehouseTitle: data.warehouseTitle ?? '',
                              state: data.state ?? '',
                              phoneNumber: data.phoneNumber ?? '',
                              name: data.name ?? '',
                              index: data.index ?? '',
                              city: data.city ?? '',
                            );
                          },
                        ),
                      );
                    }
                    if (state.status == WarehouseStatus.initial) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.status == WarehouseStatus.failed) {
                      return const Center(
                        child: Text('Ошыбка'),
                      );
                    } else {
                      return const Text('data');
                    }
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '* - технику компании Apple можно отправлять только на дополнительный склад',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkModel extends StatelessWidget {
  const _LinkModel({
    Key? key,
    required this.city,
    required this.index,
    required this.name,
    required this.phoneNumber,
    required this.state,
    required this.street,
    required this.warehouseTitle,
  }) : super(key: key);
  final String city;
  final String index;
  final String name;
  final String phoneNumber;
  final String state;
  final String street;
  final String warehouseTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        width: 300.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100.0,
                child: Text(
                  warehouseTitle,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('ФИО'),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              _LinkCopy(
                title: 'Улица',
                dataTitle: street,
              ),
              _LinkCopy(
                title: 'Город',
                dataTitle: city,
              ),
              _LinkCopy(
                title: 'Штат',
                dataTitle: state,
              ),
              _LinkCopy(
                title: 'Индекс',
                dataTitle: index,
              ),
              _LinkCopy(
                title: 'Телефон',
                dataTitle: phoneNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkCopy extends StatefulWidget {
  const _LinkCopy({
    Key? key,
    required this.title,
    required this.dataTitle,
  }) : super(key: key);
  final String title;
  final String dataTitle;

  @override
  State<_LinkCopy> createState() => _LinkCopyState();
}

class _LinkCopyState extends State<_LinkCopy> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  Widget toast(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.green,
      ),
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              Text(
                widget.dataTitle,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 3,
          child: InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: widget.dataTitle))
                  .then((_) {
                fToast.showToast(
                  child: toast('${widget.title} скопировано'),
                  gravity: ToastGravity.BOTTOM,
                  toastDuration: const Duration(seconds: 2),
                );
              });
            },
            child: SvgPicture.asset(
              AppIcons.copy,
              color: AppColors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
