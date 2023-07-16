import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qrmenu/core/init/provider/dashboard_provider.dart';
import 'package:qrmenu/core/init/provider/delete_business_provider.dart';
import 'package:qrmenu/core/init/provider/home_provider.dart';
import 'package:qrmenu/core/init/provider/login_provider.dart';
import 'package:qrmenu/core/init/provider/qr_provider.dart';
import 'package:qrmenu/core/init/provider/register_provider.dart';
import 'package:qrmenu/core/init/provider/reset_password_provider.dart';
import 'package:qrmenu/core/init/provider/products_provider.dart';
import 'package:qrmenu/core/init/provider/category_provider.dart';
import 'package:qrmenu/core/init/provider/subscription_provider.dart';
import 'package:qrmenu/core/init/provider/templates_provider.dart';
import 'package:qrmenu/core/init/provider/theme_provider.dart';

import 'add_ons_provider.dart';

import 'change_language_provider.dart';
import 'create_product_provider.dart';
import 'edit_business_provider.dart';
import 'location_pick_provider.dart';

class Providers {
  static Providers? _instance;

  static Providers get instance {
    _instance ??= Providers._();
    return _instance!;
  }

  late final List<SingleChildWidget> providers;
  Providers._() {
    providers = [
      ChangeNotifierProvider(create: (context) => ThemeProvider.instance),
      ChangeNotifierProvider(create: (context) => LoginProvider.instance),
      ChangeNotifierProvider(
          create: (context) => ResetPasswordProvider.instance),
      ChangeNotifierProvider(create: (context) => RegisterProvider.instance),
      ChangeNotifierProvider(create: (context) => HomeProvider.instance),
      ChangeNotifierProvider(
          create: (context) => SubscriptionProvider.instance),
      ChangeNotifierProvider(
          create: (context) => EditBusinessProvider.instance),
      ChangeNotifierProvider(
          create: (context) => LocationPickProvider.instance),
      ChangeNotifierProvider(create: (context) => TemplatesProvider.instance),
      ChangeNotifierProvider(create: (context) => CategoryProvider.instance),
      ChangeNotifierProvider(create: (context) => ProductsProvider.instance),
      ChangeNotifierProvider(
          create: (context) => CreateProductProvider.instance),
      ChangeNotifierProvider(create: (context) => AddOnsProvider.instance),
      ChangeNotifierProvider(create: (context) => DashboardProvider.instance),
      ChangeNotifierProvider(
          create: (context) => ChangeLanguageProvider.instance),
      ChangeNotifierProvider(create: (context) => QrProvider.instance),
      ChangeNotifierProvider(
          create: (context) => DeleteBusinessProvider.instance),
    ];
  }
}
