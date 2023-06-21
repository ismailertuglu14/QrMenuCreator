import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qrmenu/core/init/provider/login_provider.dart';
import 'package:qrmenu/core/init/provider/register_provider.dart';
import 'package:qrmenu/core/init/provider/reset_password_provider.dart';
import 'package:qrmenu/core/init/provider/theme_provider.dart';

class Providers {
  Providers._();

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => ThemeProvider.instance),
    ChangeNotifierProvider(create: (context) => LoginProvider.instance),
    ChangeNotifierProvider(create: (context) => ResetPasswordProvider.instance),
    ChangeNotifierProvider(create: (context) => RegisterProvider.instance),

  ];
}
