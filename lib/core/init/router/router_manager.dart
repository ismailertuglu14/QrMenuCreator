import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/view/auth/register/view/register_view.dart';
import 'package:qrmenu/view/auth/resetpassword/view/reset_password_view.dart';
import 'package:qrmenu/view/pages/addons/view/add_ons_view.dart';
import 'package:qrmenu/view/pages/changelanguage/view/change_language_view.dart';
import 'package:qrmenu/view/pages/createproduct/view/create_product_view.dart';
import 'package:qrmenu/view/pages/deletebusiness/view/delete_business_view.dart';
import 'package:qrmenu/view/pages/feedback/view/feed_back_view.dart';
import 'package:qrmenu/view/pages/home/view/home_view.dart';
import 'package:qrmenu/view/pages/locationpicker/view/location_picker_view.dart';
import 'package:qrmenu/view/pages/qr/view/qr_view.dart';

import '../../../view/auth/login/view/login_view.dart';
import '../../../view/auth/onboard/view/onboard_view.dart';
import '../../../view/auth/splash/view/splash_view.dart';
import '../../../view/pages/category/view/category_view.dart';
import '../../../view/pages/changecurrency/view/change_currency_view.dart';
import '../../../view/pages/changepassword/view/change_password_view.dart';
import '../../../view/pages/editbusiness/view/edit_business_view.dart';
import '../../../view/pages/error/eror_view.dart';

import '../../../view/pages/products/view/products_view.dart';
import '../../../view/pages/socialmedias/view/social_medias_view.dart';
import '../../constans/enum/route_keys.dart';

class RouterManager with ChangeNotifier {
  RouterManager._();

  static GoRouter routes = GoRouter(
    errorBuilder: (context, state) => CommonErrorView(error: state.error),
    initialLocation: RouterKeys.ONBOARD.route,
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
          pageBuilder: (context, state) =>
              buildPageWithSlideRightToLeftTransition(
                  context: context,
                  state: state,
                  child: const EditBusinessView())),
      GoRoute(
          name: RouterKeys.QR.name,
          path: RouterKeys.QR.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: QrView(
                menuId: state.queryParams["menuId"],
              ))),
      GoRoute(
          name: RouterKeys.CATEGORY.name,
          path: RouterKeys.CATEGORY.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: CategoryView(
                id: state.queryParams["id"],
                name: state.queryParams["name"],
              ))),
      GoRoute(
          name: RouterKeys.PRODUCTS.name,
          path: RouterKeys.PRODUCTS.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: ProductsView(
                  title: state.queryParams["title"],
                  categoryId: state.queryParams["categoryId"],
                  menuId: state.queryParams["menuId"]))),
      GoRoute(
          name: RouterKeys.CREATE_PRODUCT.name,
          path: RouterKeys.CREATE_PRODUCT.route,
          pageBuilder: (context, state) => buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: CreateProductView(
                  productId: state.queryParams["productId"],
                  categoryId: state.queryParams["categoryId"],
                  menuId: state.queryParams["menuId"]))),
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
      GoRoute(
          name: RouterKeys.CHANGE_PASSWORD.name,
          path: RouterKeys.CHANGE_PASSWORD.route,
          pageBuilder: (context, state) =>
              buildPageWithSlideRightToLeftTransition(
                  context: context, state: state, child: ChangePasswordView())),
      GoRoute(
          name: RouterKeys.CHANGE_LANGUAGE.name,
          path: RouterKeys.CHANGE_LANGUAGE.route,
          pageBuilder: (context, state) =>
              buildPageWithSlideRightToLeftTransition(
                  context: context, state: state, child: ChangeLanguageView())),
      GoRoute(
          name: RouterKeys.DELETE_BUSINESS.name,
          path: RouterKeys.DELETE_BUSINESS.route,
          pageBuilder: (context, state) =>
              buildPageWithSlideRightToLeftTransition(
                  context: context, state: state, child: DeleteBusinessView())),
      GoRoute(
          name: RouterKeys.CHANGE_CURRENCY.name,
          path: RouterKeys.CHANGE_CURRENCY.route,
          pageBuilder: (context, state) => buildPageWithSlideTransition(
              context: context, state: state, child: ChangeCurrencyView())),
      GoRoute(
          name: RouterKeys.SOCIAL_MEDIAS.name,
          path: RouterKeys.SOCIAL_MEDIAS.route,
          pageBuilder: (context, state) => buildPageWithSlideTransition(
              context: context, state: state, child: SocialMediasView())),
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

CustomTransitionPage buildPageWithSlideRightToLeftTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    transitionDuration: PageDurations.min(),
    reverseTransitionDuration: PageDurations.min(),
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
