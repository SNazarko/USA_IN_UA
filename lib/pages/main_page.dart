import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usa_in_ua/pages/profile_page/profile_page.dart';
import 'package:usa_in_ua/pages/purchase_page/purchase_page.dart';
import 'package:usa_in_ua/pages/test.dart';

import '../blocs/navigation_bloc/navigation_bloc.dart';
import '../blocs/navigation_bloc/navigation_event.dart';
import '../blocs/navigation_bloc/navigation_state.dart';
import '../routes/app_router.dart';
import '../widgets/navigation/custom_bottom_nav_bar.dart';
import 'delivery_page/delivery_page.dart';
import 'home_page/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<String> _pages = [
    HomePage.routeName,
    DeliveryPage.routeName,
    Test.routeName,
    PurchasePage.routeName,
    ProfilePage.routeName,
  ];

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  void _onSelectMenu(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (_) => false,
      );
    }
  }

  void _onSelectTab(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (route) => false,
      );
    }
  }

  Future<bool> _onWillPop() async {
    final bool maybePop = await _navigatorKey.currentState!.maybePop();

    return !maybePop;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (_, state) {
          if (state.status == NavigationStateStatus.tab) {
            _onSelectTab(state.route);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: Navigator(
                key: _navigatorKey,
                initialRoute: HomePage.routeName,
                onGenerateRoute: AppRouter.generateRoute,
              ),
              drawerEnableOpenDragGesture: false,
              bottomNavigationBar: CustomBottomNavBar(
                currentTab: state.currentIndex,
                onSelect: (int index) {
                  if (state.currentIndex != index) {
                    context.read<NavigationBloc>().add(
                          NavigateTab(
                            tabIndex: index,
                            route: _pages[index],
                          ),
                        );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
