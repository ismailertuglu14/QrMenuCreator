import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/view/auth/register/view/register_view.dart';
import 'package:qrmenu/view/auth/resetpassword/view/reset_password_view.dart';
import 'package:qrmenu/view/pages/home/view/home_view.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/onboard/view/onboard_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/pages/error/eror_view.dart';
import '../../constans/enum/route_keys.dart';

class RouterManager with ChangeNotifier {
  RouterManager._();

  static GoRouter routes = GoRouter(
    errorBuilder: (context, state) => CommonErrorView(error: state.error),
    initialLocation: (Platform.isAndroid || Platform.isIOS)
        ? RouterKeys.SPLASH.route
        : RouterKeys.SPLASH.route,
    routes: [
      GoRoute(
          name: RouterKeys.SPLASH.name,
          path: RouterKeys.SPLASH.route,
          builder: (context, state) => const SplashView()),
      GoRoute(
          name: RouterKeys.ONBOARD.name,
          path: RouterKeys.ONBOARD.route,
          pageBuilder: (context, state) => buildPageWithSlideTransition(
              context: context, state: state, child: const OnboardView())),
      GoRoute(
          name: RouterKeys.HOME.name,
          path: RouterKeys.HOME.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const HomeView())),
      GoRoute(
          name: RouterKeys.LOGIN.name,
          path: RouterKeys.LOGIN.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const LoginView())),
      GoRoute(
          name: RouterKeys.REGISTER.name,
          path: RouterKeys.REGISTER.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const RegisterView())),
      GoRoute(
          name: RouterKeys.RESET_PASSWORD.name,
          path: RouterKeys.RESET_PASSWORD.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: const ResetPasswordView())),
      GoRoute(
          name: RouterKeys.ERROR.name,
          path: RouterKeys.ERROR.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const CommonErrorView())),
    ],
  );
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      });
}

CustomTransitionPage buildPageWithSlideTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
