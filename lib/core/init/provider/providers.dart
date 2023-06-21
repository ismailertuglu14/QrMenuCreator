import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qrmenu/core/init/provider/theme_provider.dart';

class Providers {
  Providers._();

  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => ThemeProvider.instance)
  ];
}
