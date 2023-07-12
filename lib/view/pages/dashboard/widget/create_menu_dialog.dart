import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';

import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/init/provider/dashboard_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';

class CreateMenuDialog extends StatelessWidget {
  const CreateMenuDialog({super.key, required this.createMenu});

  final Future<void> Function() createMenu;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: PagePadding.allMedium(),
        child: Consumer<DashboardProvider>(
          builder: (context, provider, child) =>
              Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: PagePadding.allMedium(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Create Menu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.text.titleLarge?.fontSize),
                    textAlign: TextAlign.center,
                  ),
                  IconButton(
                      onPressed: () => context.pop(), icon: Icon(Icons.close)),
                ],
              ),
            ),
            CommonTextField(
              hintText: "Menu Name",
              textController: provider.menuNameController,
            ),
            Padding(
              padding: PagePadding.verticalHight(),
              child: Row(
                children: [
                  Consumer<DashboardProvider>(
                    builder: (context, provider, child) => provider.isLoading
                        ? LottieKeys.loading.path(
                            width: context.width / 4,
                            height: context.height / 15)
                        : Expanded(
                            child: CommonElevationButton(
                                child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: Text("Create"),
                                ),
                                onPressed: () {
                                  createMenu();
                                  provider.menuNameController.text.isNotEmpty
                                      ? context.pop()
                                      : null;
                                }),
                          ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
