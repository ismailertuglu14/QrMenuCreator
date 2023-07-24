import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/template_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/provider/dashboard_provider.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/custom_switch_list_tile.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/outline_button.dart';
import 'package:qrmenu/view/pages/dashboard/service/Dashboard_service.dart';
import 'package:qrmenu/view/pages/qr/service/Qr_service.dart';
import 'package:screenshot/screenshot.dart';
import 'package:zxing_lib/qrcode.dart';

import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/qr_provider.dart';
import '../../../../core/init/provider/templates_provider.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/customqrgenerator/colors/color.dart';
import '../../../../product/widget/customqrgenerator/options/colors.dart';
import '../../../../product/widget/customqrgenerator/options/options.dart';
import '../../../../product/widget/customqrgenerator/options/shapes.dart';
import '../../../../product/widget/customqrgenerator/qr_painter.dart';
import '../../../../product/widget/customqrgenerator/shapes/ball_shape.dart';
import '../../../../product/widget/customqrgenerator/shapes/frame_shape.dart';
import '../../../../product/widget/customqrgenerator/shapes/pixel_shape.dart';
import '../../../../product/widget/item_count_circle.dart';
import '../../dashboard/model/get_restaurant_menus_response_model.dart';
import '../../templates/widget/template_list.dart';
import '../model/publish_unpublish_menu_response_model.dart';
import '../widget/qr_border_painter.dart';
part '../viewmodel/qr_view_model.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key, this.menuId}) : super(key: key);
  final String? menuId;
  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends QrViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text("QR Code")),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            width: context.width,
            height: context.height * .5,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Screenshot(
                    controller: _screenshotController,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: context.height,
                        width: context.width,
                        child: CustomPaint(
                          isComplex: true,
                          painter: QrPainter(
                              data: "https://www.google.com",
                              options: const QrOptions(
                                  ecl: ErrorCorrectionLevel.H,
                                  shapes: QrShapes(
                                      lightPixel: QrPixelShapeRoundCorners(
                                          cornerFraction: .5),
                                      darkPixel: QrPixelShapeRoundCorners(
                                          cornerFraction: .5),
                                      frame: QrFrameShapeRoundCorners(
                                          cornerFraction: .25),
                                      ball: QrBallShapeRoundCorners(
                                          cornerFraction: .25)),
                                  colors: QrColors(
                                      background:
                                          QrColorSolid(Colors.transparent),
                                      light: QrColorLinearGradient(
                                          colors: [
                                            Color(0xFFFF0000),
                                            Color(0xFF0000FF)
                                          ],
                                          orientation:
                                              GradientOrientation.leftDiagonal),
                                      dark: QrColorLinearGradient(
                                          colors: [
                                            Color(0xFFFF0000),
                                            Color(0xFF0000FF)
                                          ],
                                          orientation: GradientOrientation
                                              .leftDiagonal)))),
                          size: const Size(350, 350),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: DraggableScrollableSheet(
                snap: true,
                initialChildSize: .5,
                minChildSize: .5,
                maxChildSize: .9,
                snapAnimationDuration: PageDurations.min(),
                snapSizes: const [.5, .9],
                builder: (context, scrollController) => SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      controller: scrollController,
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colorScheme.onSecondary,
                          border: Border.all(
                              color:
                                  context.colorScheme.surface.withOpacity(0.1)),
                          borderRadius: PageBorderRadius.spesificTop(),
                        ),
                        child: SizedBox(
                          height: context.height * .8,
                          width: context.width,
                          child: Column(children: [
                            Padding(
                              padding: PagePadding.allMedium(),
                              child: Container(
                                height: context.height * .005,
                                width: context.width * .1,
                                decoration: BoxDecoration(
                                  color: context.colorScheme.surface
                                      .withOpacity(.5),
                                  borderRadius: PageBorderRadius.allMedium(),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: OutlinedButton.icon(
                                      icon: Icon(Icons.file_download_outlined),
                                      label: Padding(
                                        padding: PagePadding.allMedium(),
                                        child: Text("Download"),
                                      ),
                                      onPressed: () => downloadTemplate()),
                                )),
                                Expanded(
                                    child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: OutlinedButton.icon(
                                      icon: Icon(
                                          Icons.mark_email_unread_outlined),
                                      label: Padding(
                                        padding: PagePadding.allMedium(),
                                        child: Text("Send email"),
                                      ),
                                      onPressed: () {}),
                                )),
                              ],
                            ),
                            Consumer<QrProvider>(
                              builder: (context, provider, child) =>
                                  DropdownButton(
                                isExpanded: true,
                                value: provider.selectedMenu,
                                hint: Text("Select Menu"),
                                underline: SizedBox.shrink(),
                                icon: Icon(Icons.arrow_drop_down_rounded),
                                padding: PagePadding.allHeight(),
                                menuMaxHeight: context.height * .5,
                                borderRadius: PageBorderRadius.allMedium(),
                                items: List.generate(
                                    provider.menus?.length ?? 0,
                                    (index) => DropdownMenuItem(
                                          value: provider.menus?[index].id,
                                          child: Row(
                                            children: [
                                              Text(
                                                  provider.menus?[index].name
                                                          .toUpperCase() ??
                                                      "",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Spacer(),
                                              Text(
                                                  "${provider.menus?[index].productCount ?? 0} Products",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                        )),
                                onChanged: (value) {
                                  int clickedMenuIndex = provider.menus
                                          ?.indexWhere(
                                              (menu) => menu.id == value) ??
                                      -1;

                                  provider.changeSelectedMenu(
                                      value!,
                                      provider.menus![clickedMenuIndex]
                                          .isPublished);
                                },
                              ),
                            ),
                            Consumer<QrProvider>(
                              builder: (context, provider, child) =>
                                  DropdownButton(
                                isExpanded: true,
                                value: provider.selectedTemplate,
                                hint: Text("Select Template"),
                                underline: SizedBox.shrink(),
                                icon: Icon(Icons.arrow_drop_down_rounded),
                                padding: PagePadding.allHeight(),
                                menuMaxHeight: context.height * .5,
                                borderRadius: PageBorderRadius.allMedium(),
                                items: List.generate(
                                    TemplateKeys.values.length,
                                    (index) => DropdownMenuItem(
                                          value: TemplateKeys.values[index],
                                          child: Text(
                                              TemplateKeys.values[index].name,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                onChanged: (value) =>
                                    provider.changeSelectedTemplate(
                                        value as TemplateKeys),
                              ),
                            ),
                            SizedBox(
                              height: context.height / 8,
                              child: Consumer<QrProvider>(
                                builder: (context, provider, child) =>
                                    GridView.builder(
                                  itemCount: TemplateKeys.values.length,
                                  padding: PagePadding.allDefault(),
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate: PageGridDelegates.medium(),
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () =>
                                        provider.changeSelectedTemplate(
                                            TemplateKeys.values[index]),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: context.colorScheme.surface
                                              .withOpacity(0.05),
                                          borderRadius:
                                              PageBorderRadius.allMedium(),
                                          border: Border.all(
                                            color: provider.selectedTemplate ==
                                                    TemplateKeys.values[index]
                                                ? context.colorScheme.primary
                                                : Colors.transparent,
                                            width: 2,
                                          )),
                                      clipBehavior: Clip.antiAlias,
                                      child: templateList()[index]
                                          .imageAsset(fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: PagePadding.allMedium(),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CommonElevationButton(
                                      onPressed: publishUnpublishMenu,
                                      child: Padding(
                                        padding: PagePadding.allMedium(),
                                        child: Consumer<QrProvider>(
                                            builder: (context, provider,
                                                    child) =>
                                                Text(provider.isPublished !=
                                                            null &&
                                                        provider.isPublished!
                                                    ? "Unpublish"
                                                    : "Publish")),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
