import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repositories/auth_repositories.dart';
import '../bloc/authorisation_bloc.dart';
import '../widgets/login/login.dart';
import '../widgets/sms/sms.dart';
import '../widgets/welcome/welcome.dart';

class AuthorisationsPages extends StatelessWidget {
  AuthorisationsPages({Key? key}) : super(key: key);
  static const routeName = '/';
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: AuthRepositories.instance.user != null
          ? const Welcome()
          : PageView(
              controller: controller,
              children: [
                Login(
                  controller: controller,
                  phoneController: phoneController,
                  emailController: emailController,
                  nameController: nameController,
                ),
                Sms(
                  controller: controller,
                  phoneController: phoneController,
                ),
                const Welcome(),
              ],
            ),
    );
  }
}
