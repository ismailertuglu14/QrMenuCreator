import 'package:flutter/material.dart';
import 'package:qrmenu/product/widget/app_bar.dart';

import '../../../../product/utility/page_padding.dart';
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        width: BarReaderSize.width * 1.5,
                        height: BarReaderSize.height * 1.5,
                        child: Image.network(
                            "https://user-images.githubusercontent.com/4993276/69906263-8d535d00-139f-11ea-8ee8-6f21a41bc60e.jpeg")),
                    Positioned(
                      child: CustomPaint(
                        painter: BorderPainter(),
                        child: SizedBox(
                          width: BarReaderSize.width * 2,
                          height: BarReaderSize.height * 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: Text("Email QR Code")),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                          onPressed: () {}, child: Text("Download QR Code")),
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
