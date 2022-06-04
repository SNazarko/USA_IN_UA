import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authorisation_bloc.dart';
import '../widgets/registration_page/registration_page.dart';
import '../widgets/sms_page/sms_page.dart';
import '../widgets/welcome_page/welcome_page.dart';

class RegistrationPagesArguments {
  RegistrationPagesArguments(
    this.nameController,
    this.emailController,
  );
  TextEditingController nameController;
  TextEditingController emailController;
}

class RegistrationPages extends StatelessWidget {
  RegistrationPages({
    Key? key,
    required this.nameController,
    required this.emailController,
  }) : super(key: key);
  static const routeName = '/authorisations_pages/registration_pages.dart';
  final TextEditingController phoneController = TextEditingController();
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
          RegistrationPage(
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            controller: controller,
          ),
          SmsPage(
            controller: controller,
            phoneController: phoneController,
            emailController: emailController,
            nameController: nameController,
          ),
          const WelcomePage(),
        ],
      ),
    );
  }
}
