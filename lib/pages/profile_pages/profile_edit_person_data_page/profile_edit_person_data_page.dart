import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import '../../../database/local_database.dart';
import '../../../models/user_model.dart';
import '../../../repositories/goods_repositories.dart';
import '../../../repositories/profile_repositories.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_icons.dart';
import '../../../widgets/icon_link.dart';
import 'bloc/profile_edit_bloc.dart';


class ProfileEditPersonDataPage extends StatelessWidget {
   ProfileEditPersonDataPage({Key? key}) : super(key: key);
  static const routeName = '/profile_edit_person_data';
   final TextEditingController controllerName = TextEditingController();
   final TextEditingController controllerNumber = TextEditingController();
   final TextEditingController controllerDate = TextEditingController();
   final TextEditingController controllerMail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileEditBloc>(
      create: (context) =>
      ProfileEditBloc()
        ..add(const LoadProfileEditEvent(),),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: InkWell(
            onTap: () async{
              LocalDB.instance.initializeHive2();
              final  box = await Hive.openBox<UserModel>('profile_box');
              final dataList = box.values.toList();
              final data = dataList.single;
               bool isValue =
                   data.userName == controllerName.text ||
                   data.userEmail == controllerMail.text ||
              data.userPhoneNumb == controllerNumber.text;
              if(isValue){
                ProfileRepositories.instance.updateProfile(
                    controllerName.text,
                    controllerMail.text,
                    controllerNumber.text,
                    controllerDate.text,
                    false
                );
                final user = UserModel(
                  userName: controllerName.text,
                  userEmail: controllerMail.text,
                  userPhoneNumb: controllerNumber.text,
                  userSex: false,
                  userDate: controllerDate.text,
                );
                await box.putAt(0, user);
              }



              Navigator.pop(context);
              },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                AppIcons.arrowLeft,
              ),
            ),
          ),
          title: const Text(
            'Личные данные',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16.0,
              ),
              child: SvgPicture.asset(
                AppIcons.menu,
              ),
            ),
          ],
        ),
        body: BlocBuilder<ProfileEditBloc, ProfileEditState>(
          builder: (context, state) {
            if (state.status == ProfileEditStatus.success){
              final dataList = state.list;
              if(dataList.isEmpty){return const CircularProgressIndicator();}
              if(dataList.isNotEmpty){
                final data = dataList.single;
                controllerName.text = data.userName;
                controllerNumber.text =  data.userPhoneNumb;
                controllerDate.text = data.userDate ?? '';
                controllerMail.text = data.userEmail;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        DataOutput(
                            controller: controllerName,
                            dataOutputStatus: DataOutputStatus.name
                        ),
                        DataOutput(
                          inputFormatters: [MaskedInputFormatter('##.##.####'),],
                          controller: controllerDate,
                          dataOutputStatus: DataOutputStatus.data,
                        ),
                         _DataSex(sex: data.userSex,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Контактная информация',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        DataOutput(
                          controller: controllerNumber,
                          dataOutputStatus: DataOutputStatus.number,
                        ),
                        DataOutput(
                          controller: controllerMail,
                          dataOutputStatus: DataOutputStatus.emailAddress,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                          ),
                          child: InkWell(
                            onTap: () {
                              ProfileRepositories.instance.getProfile();
                            },
                            child: const IconLink(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              icon: AppIcons.logout,
                              text: 'Вийти',
                              crossAxisAlignment: CrossAxisAlignment.center,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );}
            }
            if (state.status == ProfileEditStatus.initial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == ProfileEditStatus.failed) {
              return const Center(
                child: Text('Ошыбка'),
              );
            } else {
              return const Text('data');
            }



          },
        ),
      ),
    );
  }
}

enum DataOutputStatus {
  number,
  name,
  emailAddress,
  data,
}

class DataOutput extends StatelessWidget {
  const DataOutput({
    Key? key,
    this.dataOutputStatus = DataOutputStatus.number,
    this.onChanged,
    this.onEditingComplete,
    this.controller, this.inputFormatters,
  }) : super(key: key);
  final DataOutputStatus dataOutputStatus;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  TextInputType _dataOutputType(DataOutputStatus type) {
    if (type == DataOutputStatus.number) return TextInputType.number;
    if (type == DataOutputStatus.name) return TextInputType.name;
    if (type == DataOutputStatus.data) return TextInputType.datetime;
    if (type == DataOutputStatus.emailAddress) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  String _hintTextType(DataOutputStatus type) {
    if (type == DataOutputStatus.number) return 'Ваш номер телефона*';
    if (type == DataOutputStatus.name) return 'Ваше имя*';
    if (type == DataOutputStatus.emailAddress) return 'Ваш email*';
    if (type == DataOutputStatus.data) return 'Дата рождения';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: Container(
        width: double.infinity,
        height: 57.0,
        decoration: const BoxDecoration(
          color: AppColors.bass,
          borderRadius: BorderRadius.all(
            Radius.circular(
              15.0,
            ),
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 12.0
              ),
              child: Text(
                _hintTextType(dataOutputStatus),
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.noActive,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, left: 2.0
              ),
              child: TextField(
                inputFormatters: inputFormatters,
                onEditingComplete: onEditingComplete,
                controller: controller,
                keyboardType: _dataOutputType(dataOutputStatus),
                style: const TextStyle(
                    fontSize: 16.0,
                    color: AppColors.text,
                    fontWeight: FontWeight.w700),
                decoration: const InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataSex extends StatefulWidget {
  const _DataSex({
    Key? key, required this.sex,
  }) : super(key: key);
final bool sex;

  @override
  State<_DataSex> createState() => _DataSexState();
}

class _DataSexState extends State<_DataSex> {
  bool sex = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10.0,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Пол',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        sex = !sex;
                        setState(() {

                        });
                      },
                      child: IconLink(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        icon: AppIcons.vectorMan,
                        text: 'Мужчина',
                        crossAxisAlignment: CrossAxisAlignment.center,
                        color: widget.sex ? AppColors.noActive : AppColors.blue,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        sex = !sex;
                        setState(() {

                        });
                      },
                      child: IconLink(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0,
                        icon: AppIcons.vectorWoman,
                        text: 'Женщина',
                        crossAxisAlignment: CrossAxisAlignment.center,
                        color: sex ? AppColors.blue : AppColors.noActive,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
