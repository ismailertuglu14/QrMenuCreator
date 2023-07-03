import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/view/auth/register/view/register_view.dart';
import 'package:qrmenu/view/auth/resetpassword/view/reset_password_view.dart';
import 'package:qrmenu/view/pages/addons/view/add_ons_view.dart';
import 'package:qrmenu/view/pages/createitem/view/create_item_view.dart';
import 'package:qrmenu/view/pages/feedback/view/feed_back_view.dart';
import 'package:qrmenu/view/pages/home/view/home_view.dart';
import 'package:qrmenu/view/pages/locationpicker/view/location_picker_view.dart';
import 'package:qrmenu/view/pages/qr/view/qr_view.dart';
import 'package:qrmenu/view/pages/sectionitems/view/section_items_view.dart';
import 'package:qrmenu/view/pages/sections/view/sections_view.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/onboard/view/onboard_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/pages/editbusiness/view/edit_business_view.dart';
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
          name: RouterKeys.FEED_BACK.name,
          path: RouterKeys.FEED_BACK.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const FeedBackView())),
      GoRoute(
          name: RouterKeys.ERROR.name,
          path: RouterKeys.ERROR.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const CommonErrorView())),
      GoRoute(
          name: RouterKeys.EDIT_BUSINESS.name,
          path: RouterKeys.EDIT_BUSINESS.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const EditBusinessView())),
      GoRoute(
          name: RouterKeys.QR.name,
          path: RouterKeys.QR.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const QrView())),
      GoRoute(
          name: RouterKeys.SECTIONS.name,
          path: RouterKeys.SECTIONS.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const SectionsView())),
      GoRoute(
          name: RouterKeys.SECTION_ITEMS.name,
          path: RouterKeys.SECTION_ITEMS.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: SectionItemsView(title: state.queryParams["title"]))),
      GoRoute(
          name: RouterKeys.CREATE_ITEM.name,
          path: RouterKeys.CREATE_ITEM.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const CreateItemView())),
      GoRoute(
          name: RouterKeys.ADD_ONS.name,
          path: RouterKeys.ADD_ONS.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context, state: state, child: const AddOnsView())),
      GoRoute(
          name: RouterKeys.LOCATION_PICKER.name,
          path: RouterKeys.LOCATION_PICKER.route,
          pageBuilder: (context, state) => buildPageWithSlideTransition(
              context: context, state: state, child: LocationPickerView())),
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
