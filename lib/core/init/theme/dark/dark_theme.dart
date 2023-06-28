import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/custom_tab_indicator.dart';

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

          background: Color(0xFF161618), //const dark
          onSecondary: Color(0xFF161618), //opposite

          onPrimary: Color(0xFF161618), //same dark
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
            const TimePickerThemeData(backgroundColor: Color(0xFF161618)),
        drawerTheme: const DrawerThemeData(
            scrimColor: Colors.transparent,
            backgroundColor: Color(0xFF161618),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)))),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Color(0xFF3AB86F)),
        scaffoldBackgroundColor: const Color(0xFF161618),
        cardTheme: CardTheme(
          color: const Color(0xFF161618).withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
          backgroundColor: Color(0xFF161618),
          collapsedBackgroundColor: Color(0xFF161618),
          childrenPadding: PagePadding.allDefault(),
          tilePadding: PagePadding.allDefault(),
          collapsedShape: RoundedRectangleBorder(
              borderRadius: PageBorderRadius.allMedium()),
        ),
        checkboxTheme: CheckboxThemeData(
            fillColor:
                MaterialStateProperty.all<Color>(const Color(0xFF3AB86F)),
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
            backgroundColor: Color(0xFF161618),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)))),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white70,
          unselectedLabelColor: Colors.white30,
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          indicator: CustomTabIndicator(),
        ),
        radioTheme: RadioThemeData(
            fillColor:
                MaterialStateProperty.all<Color>(const Color(0xFF3AB86F))),
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
          textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(color: Colors.white70)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white70),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white70),
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
            color: const Color(0xFF161618),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        dialogTheme: const DialogTheme(
            elevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24)),
        listTileTheme: const ListTileThemeData(
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      );
}
