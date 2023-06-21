import 'dart:async';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../cache/local_storage.dart';
import '../network/https_ovveride.dart';

class InitApp {
  InitApp._();
  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();
    LocaleStorage.preferencesInit();
  
  }
}
