import 'package:flutter/material.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:zxing_lib/qrcode.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/customqrgenerator/colors/color.dart';
import '../../../../product/widget/customqrgenerator/options/colors.dart';
import '../../../../product/widget/customqrgenerator/options/options.dart';
import '../../../../product/widget/customqrgenerator/options/shapes.dart';
import '../../../../product/widget/customqrgenerator/qr_painter.dart';
import '../../../../product/widget/customqrgenerator/shapes/ball_shape.dart';
import '../../../../product/widget/customqrgenerator/shapes/frame_shape.dart';
import '../../../../product/widget/customqrgenerator/shapes/pixel_shape.dart';
import '../widget/qr_border_painter.dart';
part '../viewmodel/qr_view_model.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends QrViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text("QR Code")),
      body: Center(
        child: Padding(
          padding: PagePadding.allMedium(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: CustomPaint(
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
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: PagePadding.allMedium(),
                                child: Text("Email QR Code"),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: PagePadding.allMedium(),
                                child: Text("Download QR Code"),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
