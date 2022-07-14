import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_page.dart';
import 'package:usa_in_ua/pages/purchase_page/purchase_page.dart';
import 'package:usa_in_ua/resources/app_icons.dart';
import '../blocs/navigation_bloc/navigation_bloc.dart';
import '../blocs/navigation_bloc/navigation_event.dart';
import '../blocs/navigation_bloc/navigation_state.dart';
import '../resources/app_colors.dart';
import '../routes/app_router.dart';
import '../widgets/navigation/bloc/anim_bloc.dart';
import '../widgets/navigation/custom_bottom_nav_bar.dart';
import 'delivery_page/delivery_page.dart';
import 'home_pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  bool _visible = false;
  late AnimationController controller;
  late Animation animation;
  Timer? _timerAmplitude;

  void _animPlus() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _timerAmplitude!.cancel();
      }
    });
  }

  void _animMinus() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInQuart,
    );
    controller.reverse(from: 1);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        _timerAmplitude!.cancel();
      }
    });
  }

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

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
        BlocProvider<AnimBloc>(
          create: (_) => AnimBloc(),
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
              body: Stack(
                children: [
                  Navigator(
                    key: _navigatorKey,
                    initialRoute: HomePage.routeName,
                    onGenerateRoute: AppRouter.generateRoute,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: MediaQuery.of(context).size.height,
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(
                      visible: _visible,
                      child: Container(
                        width: double.infinity,
                        height: 250.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: const [
                              _LinkButton(
                                title: 'Заказать покупку и доставку',
                                icon: AppIcons.buy,
                                iconColor: AppColors.brown,
                                backgroundColor: AppColors.green,
                              ),
                              _LinkButton(
                                title: 'Заказать только доставку',
                                icon: AppIcons.cub,
                                iconColor: AppColors.bass,
                                backgroundColor: AppColors.blue,
                              ),
                              _LinkButton(
                                title: 'Заказать по фотографии',
                                icon: AppIcons.camera,
                                iconColor: AppColors.bass,
                                backgroundColor: AppColors.text,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              drawerEnableOpenDragGesture: false,
              bottomNavigationBar: CustomBottomNavBar(
                  currentTab: state.currentIndex,
                  onSelect: (int index) {
                    if (index == 0) {
                      context.read<NavigationBloc>().add(
                            NavigateTab(
                              tabIndex: index,
                              route: HomePage.routeName,
                            ),
                          );
                    }
                    if (index == 1) {
                      context.read<NavigationBloc>().add(
                            NavigateTab(
                              tabIndex: index,
                              route: PurchasePage.routeName,
                            ),
                          );
                    }
                    if (index == 2) {
                      _visible = !_visible;
                      if (_visible) {
                        _animPlus();
                      } else {
                        _animMinus();
                      }
                      _timerAmplitude = Timer.periodic(
                          const Duration(milliseconds: 1), (_) async {
                        context.read<AnimBloc>().add(
                              AnimEvent(
                                anim: animation.value,
                              ),
                            );
                      });
                      setState(() {});
                    }
                    if (index == 3) {
                      context.read<NavigationBloc>().add(
                            NavigateTab(
                              tabIndex: index,
                              route: DeliveryPage.routeName,
                            ),
                          );
                    }
                    if (index == 4) {
                      context.read<NavigationBloc>().add(
                            NavigateTab(
                              tabIndex: index,
                              route: ProfilePage.routeName,
                            ),
                          );
                    }

                    if (state.currentIndex != index) {
                      _timerAmplitude = Timer.periodic(
                          const Duration(milliseconds: 1), (_) async {
                        context.read<AnimBloc>().add(
                              AnimEvent(
                                anim: animation.value,
                              ),
                            );
                      });
                      setState(() {});
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.title,
    this.onTap,
    required this.backgroundColor,
  }) : super(key: key);
  final String icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Center(
                    child: SvgPicture.asset(
                  icon,
                  width: 24.0,
                  color: iconColor,
                )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
