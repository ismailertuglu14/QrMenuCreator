import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/outline_button.dart';
import 'package:screenshot/screenshot.dart';
import 'package:zxing_lib/qrcode.dart';

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
import '../../templates/widget/templates_item_builder.dart';
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
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: DropdownButton(
                isExpanded: true,
                onTap: () {},
                value: null,
                hint: Text("Select Menu"),
                underline: SizedBox.shrink(),
                padding: PagePadding.allHeight(),
                menuMaxHeight: context.height * .5,
                borderRadius: PageBorderRadius.allMedium(),
                items: List.generate(
                    10,
                    (index) => DropdownMenuItem(
                          onTap: () {},
                          value: UniqueKey(),
                          child: Text("Menu $index"),
                        )),
                onChanged: (value) {},
              )),
          Expanded(
            flex: 7,
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
                                background: QrColorSolid(Colors.transparent),
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
                                    orientation:
                                        GradientOrientation.leftDiagonal)))),
                    size: const Size(350, 350),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: PagePadding.allDefault(),
            child: Row(
              children: [
                Expanded(
                    child: CommonOutlineButton(
                        child: Padding(
                          padding: PagePadding.allMedium(),
                          child: Text("Download"),
                        ),
                        onPressed: () {})),
              ],
            ),
          ),
          Padding(
            padding: PagePadding.allDefault(),
            child: Row(
              children: [
                Expanded(
                    child: CommonOutlineButton(
                        child: Padding(
                          padding: PagePadding.allMedium(),
                          child: Text("Send email"),
                        ),
                        onPressed: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
