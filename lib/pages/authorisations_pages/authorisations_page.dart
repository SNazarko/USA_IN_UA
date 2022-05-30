import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usa_in_ua/pages/authorisations_pages/registration_page/registration_page.dart';
import 'package:usa_in_ua/pages/authorisations_pages/sms_page/sms_page.dart';
import 'package:usa_in_ua/pages/authorisations_pages/welcome_page/welcome_page.dart';

import '../../repositories/auth_repositories.dart';
import 'bloc/authorisation_bloc.dart';
import 'login_page/login_page.dart';

//     controller.animateToPage(
//         1,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeIn,
//       );
class AuthorisationsPages extends StatelessWidget {
  AuthorisationsPages({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
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
