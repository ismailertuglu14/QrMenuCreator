import 'package:flutter/cupertino.dart';

class PagePadding extends EdgeInsets {
  const PagePadding.allMin() : super.all(5);
  const PagePadding.allDefault() : super.all(8);
  const PagePadding.allLow() : super.all(10);
  const PagePadding.allMedium() : super.all(15);
  const PagePadding.allHeight() : super.all(20);

  const PagePadding.spesificAuth() : super.all(30);

  const PagePadding.horizontalMin() : super.symmetric(horizontal: 5);
  const PagePadding.horizontalDefault() : super.symmetric(horizontal: 8);
  const PagePadding.horizontalLow() : super.symmetric(horizontal: 10);
  const PagePadding.horizontalMedium() : super.symmetric(horizontal: 15);
  const PagePadding.horizontalHeight() : super.symmetric(horizontal: 20);

  const PagePadding.verticalMin() : super.symmetric(vertical: 5);
  const PagePadding.verticalDefault() : super.symmetric(vertical: 8);
  const PagePadding.verticaLow() : super.symmetric(vertical: 10);
  const PagePadding.verticalMedium() : super.symmetric(vertical: 15);
  const PagePadding.verticalHight() : super.symmetric(vertical: 20);
}
