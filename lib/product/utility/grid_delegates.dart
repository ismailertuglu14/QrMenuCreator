import 'package:flutter/material.dart';

class PageGridDelegates extends SliverGridDelegateWithFixedCrossAxisCount {
  PageGridDelegates.min()
      : super(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7);
  PageGridDelegates.normal()
      : super(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1);
  PageGridDelegates.medium()
      : super(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2);
  PageGridDelegates.height()
      : super(
            crossAxisCount: 1,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: 1.5);
  PageGridDelegates.max()
      : super(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2);
  PageGridDelegates.ultra()
      : super(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2);
}
