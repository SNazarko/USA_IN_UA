import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/auth_repositories.dart';
import '../bloc/authorisation_bloc.dart';
import '../widgets/login_page/login_page.dart';
import '../widgets/sms_page/sms_page.dart';
import '../widgets/welcome_page/welcome_page.dart';

class AuthorisationsPages extends StatelessWidget {
  AuthorisationsPages({Key? key}) : super(key: key);
  static const routeName = '/';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: AuthRepositories.instance.user != null
          ? const WelcomePage()
          : PageView(
              controller: controller,
              children: [
                LoginPage(
                  controller: controller,
                  phoneController: phoneController,
                  emailController: emailController,
                  nameController: nameController,
                ),
                SmsPage(
                  controller: controller,
                  phoneController: phoneController,
                ),
                const WelcomePage(),
              ],
            ),
    );
  }
}
