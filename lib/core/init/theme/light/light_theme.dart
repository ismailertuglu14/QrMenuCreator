import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/custom_tab_indicator.dart';

class LightThemeData {
  static LightThemeData? _instance;

  static LightThemeData get instance {
    _instance ??= LightThemeData._();
    return _instance!;
  }

  LightThemeData._();
  ThemeData get theme => ThemeData(
      fontFamily: "SFPRO",
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        secondary: Color(0xFF3AB86F), //const orange
        primary: Color(0xFF3AB86F), ////const orange

        background: Color(0xFF161618), //const dark
        onSecondary: Colors.white, //opposite

        onPrimary: Color(0xFF161618), //same dark
        onBackground: Colors.white, //same light

        surface: Color(0xFF161618), //opposite
        onSurface: Color(0xFF161618), //opposite
        error: Colors.redAccent, //const error
        onError: Colors.redAccent, //const error
      ),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(20),
        thickness: MaterialStateProperty.all<double>(2),
      ),
      drawerTheme: const DrawerThemeData(
          scrimColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFF2ecc71)),
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      timePickerTheme: const TimePickerThemeData(backgroundColor: Colors.white),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF2ecc71),
          contentTextStyle: TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
      expansionTileTheme: ExpansionTileThemeData(
        textColor: Color(0xFF161618),
        collapsedTextColor: Color(0xFF161618),
        backgroundColor: Colors.grey.shade100,
        collapsedBackgroundColor: Colors.white,
        childrenPadding: const PagePadding.allDefault(),
        tilePadding: const PagePadding.allDefault(),
        collapsedShape: const RoundedRectangleBorder(
            borderRadius: PageBorderRadius.allMedium()),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(const Color(0xFF2ecc71)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      dropdownMenuTheme: DropdownMenuThemeData(
        menuStyle: MenuStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
      listTileTheme: const ListTileThemeData(
          textColor: Color(0xFF161618),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: Color(0xFF161618).withOpacity(0.5))),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF161618)),
        side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.black12)),
      )),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Color(0xFF3AB86F),
      ),
      dialogTheme: const DialogTheme(
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF161618),
              fontSize: 24)),
      tabBarTheme: TabBarTheme(
        labelColor: Color(0xFF161618),
        unselectedLabelColor: Color(0xFF161618).withOpacity(0.5),
        overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
        indicator: CustomTabIndicator(),
      ),
      radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(const Color(0xFF3AB86F))),
      cardColor: Colors.white70,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(color: Color(0xFF161618).withOpacity(0.5))),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(
          Color(0xFF161618),
        ),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Color(0xFF161618).withOpacity(0.5))),
              elevation: MaterialStateProperty.all<double>(0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF3AB86F)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))))),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actionsIconTheme: IconThemeData(color: Color(0xFF161618)),
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}
