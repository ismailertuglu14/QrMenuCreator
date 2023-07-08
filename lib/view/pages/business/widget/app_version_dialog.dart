  import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/app/app_constants.dart';
import '../../../../product/utility/border_radius.dart';

Future<dynamic> appVersionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AboutDialog(
          applicationIcon: Icon(Icons.food_bank_outlined),
          applicationName: AppConstants.APP_NAME,
          applicationVersion: AppConstants.APP_VERSION,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: PageBorderRadius.allMedium()),
              height: context.height / 3,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: const Column(
                    children: [
                      Text(
                          "Lorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elitLorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit.Lorem impsum dolor sit amet, consectetur adipiscing elit."),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
