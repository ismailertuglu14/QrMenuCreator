import 'package:flutter/material.dart';

class PageBorderRadius extends BorderRadius {
  const PageBorderRadius.allMin() : super.all(const Radius.circular(5));
  const PageBorderRadius.allDefault() : super.all(const Radius.circular(8));
  const PageBorderRadius.allMedium() : super.all(const Radius.circular(10));
  const PageBorderRadius.allHeight() : super.all(const Radius.circular(15));

  const PageBorderRadius.verticalDefault()
      : super.vertical(
            bottom: const Radius.circular(8), top: const Radius.circular(8));
  const PageBorderRadius.verticallMedium()
      : super.vertical(
            bottom: const Radius.circular(15), top: const Radius.circular(10));
  const PageBorderRadius.verticallHeight()
      : super.vertical(
            bottom: const Radius.circular(20), top: const Radius.circular(15));

  const PageBorderRadius.horizontalDefault()
      : super.horizontal(
            left: const Radius.circular(8), right: const Radius.circular(8));

  const PageBorderRadius.horizontalMedium()
      : super.horizontal(
            left: const Radius.circular(15), right: const Radius.circular(10));
  const PageBorderRadius.horizontalHeight()
      : super.horizontal(
            left: const Radius.circular(20), right: const Radius.circular(15));

  const PageBorderRadius.spesificTop()
      : super.only(
          topLeft: const Radius.circular(10),
          topRight: const Radius.circular(10),
        );
  const PageBorderRadius.spesificSender()
      : super.only(
          topLeft: const Radius.circular(10),
          bottomLeft: const Radius.circular(10),
          bottomRight: const Radius.circular(10),
        );
  const PageBorderRadius.spesificReceived()
      : super.only(
          topRight: const Radius.circular(10),
          bottomLeft: const Radius.circular(10),
          bottomRight: const Radius.circular(10),
        );

  const PageBorderRadius.spesificNotification()
      : super.only(
          topLeft: const Radius.circular(50),
          bottomLeft: const Radius.circular(50),
          bottomRight: const Radius.circular(50),
        );
}
