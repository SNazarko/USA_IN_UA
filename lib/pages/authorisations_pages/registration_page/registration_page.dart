import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authorisation_bloc.dart';
import '../widgets/registration/registration.dart';
import '../widgets/sms/sms.dart';
import '../widgets/welcome/welcome.dart';

class RegistrationPagesArguments {
  RegistrationPagesArguments(
    this.nameController,
    this.emailController,
    this.phoneController,
  );
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
}

class RegistrationPage extends StatelessWidget {
  RegistrationPage({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);
  static const routeName = '/authorisations_pages/registration.dart';
  final TextEditingController phoneController;
  final PageController controller = PageController();
  final TextEditingController nameController;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: PageView(
        controller: controller,
        children: [
          Registration(
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            controller: controller,
          ),
          Sms(
            controller: controller,
            phoneController: phoneController,
            emailController: emailController,
            nameController: nameController,
          ),
          const Welcome(),
        ],
      ),
    );
  }
}
