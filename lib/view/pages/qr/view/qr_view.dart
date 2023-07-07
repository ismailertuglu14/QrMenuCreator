import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
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
import '../../templates/widget/templates_bottom_sheet.dart';
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
      appBar: CommonAppBar(
        title: Text("QR Code"),
        action: [
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_email_outlined)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.file_download_outlined)),
        ],
      ),
      bottomSheet: Consumer<TemplatesProvider>(
        builder: (context, provider, child) => BottomSheet(
            animationController: _animationController,
            backgroundColor: context.colorScheme.surface.withOpacity(0.05),
            shadowColor: Colors.black,
            enableDrag: true,
            onDragStart: (details) {
              provider.toggleBottomSheet();
            },
            onDragEnd: (details, {required isClosing}) {},
            showDragHandle: true,
            constraints: BoxConstraints.expand(
                height:
                    context.height * (provider.isBottomSheetOpen ? 0.3 : 0.05),
                width: context.width),
            onClosing: () {},
            builder: (context) => TemplatesBottomSheet()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: context.height * 0.3,
              width: context.width * 0.3,
              child: CustomPaint(
                isComplex: true,
                painter: QrPainter(
                    data: "https://www.google.com",
                    options: const QrOptions(
                        ecl: ErrorCorrectionLevel.H,
                        shapes: QrShapes(
                            lightPixel:
                                QrPixelShapeRoundCorners(cornerFraction: .5),
                            darkPixel:
                                QrPixelShapeRoundCorners(cornerFraction: .5),
                            frame:
                                QrFrameShapeRoundCorners(cornerFraction: .25),
                            ball: QrBallShapeRoundCorners(cornerFraction: .25)),
                        colors: QrColors(
                            background: QrColorSolid(Colors.transparent),
                            light: QrColorLinearGradient(
                                colors: [Color(0xFFFF0000), Color(0xFF0000FF)],
                                orientation: GradientOrientation.leftDiagonal),
                            dark: QrColorLinearGradient(
                                colors: [Color(0xFFFF0000), Color(0xFF0000FF)],
                                orientation:
                                    GradientOrientation.leftDiagonal)))),
                size: const Size(350, 350),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
