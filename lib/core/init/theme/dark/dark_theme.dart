import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';

class DarkThemeData {
  static DarkThemeData? _instance;

  static DarkThemeData get instance {
    _instance ??= DarkThemeData._();
    return _instance!;
  }

  DarkThemeData._();

  
  ThemeData get theme => ThemeData(
      fontFamily: "SFPRO",
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        secondary: Color(0xFF3AB86F), //const orange
        primary: Color(0xFF3AB86F), //const orange

        background: Color(0xFF292929), //const dark
        onSecondary: Color(0xFF292929), //opposite

        onPrimary: Color(0xFF292929), //same dark
        onBackground: Colors.white, //same light

        surface: Colors.white, //opposite
        onSurface: Colors.white70, //const half
        error: Colors.redAccent, //const error
        onError: Colors.redAccent, //const error
      ),
      scrollbarTheme: ScrollbarThemeData(
        radius: const Radius.circular(20),
        thickness: MaterialStateProperty.all<double>(2),
      ),
      timePickerTheme:
          const TimePickerThemeData(backgroundColor: Color(0xFF282c2c)),
      drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF282c2c)),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Color(0xFF3AB86F)),
      scaffoldBackgroundColor: const Color(0xFF292929),
      cardTheme: CardTheme(
        color: const Color(0xFF282c2c).withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF3AB86F),
          contentTextStyle: TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
      expansionTileTheme: const ExpansionTileThemeData(
        textColor: Colors.white70,
        collapsedTextColor: Colors.white70,
        backgroundColor: Colors.black12,
        collapsedBackgroundColor: Color(0xFF282c2c),
        childrenPadding: PagePadding.allDefault(),
        tilePadding: PagePadding.allDefault(),
        collapsedShape:
            RoundedRectangleBorder(borderRadius: PageBorderRadius.allMedium()),
      ),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<Color>(const Color(0xFF3AB86F)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Color(0xFF282c2c),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)))),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white70,
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        indicatorColor: Color(0xFF3AB86F),
      ),
      radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(const Color(0xFF3AB86F))),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: Color(0xFF3AB86F),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
        side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: Colors.white10)),
      )),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
      )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all<double>(0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: const Color(0xFF292929),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      dialogTheme: const DialogTheme(
          titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24)),
      listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedItemColor: Color(0xFF3AB86F),
        backgroundColor: Color(0xFF292929),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white30,
      ));
}
