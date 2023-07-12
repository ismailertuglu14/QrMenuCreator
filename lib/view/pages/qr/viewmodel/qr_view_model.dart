part of '../view/qr_view.dart';

abstract class QrViewModel extends State<QrView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ScreenshotController _screenshotController;

  Uint8List? imageFile;
  String? pdfFilePath;

  @override
  void initState() {
    super.initState();
    _screenshotController = ScreenshotController();
    _animationController = AnimationController(
        vsync: this,
        duration: PageDurations.normal(),
        reverseDuration: PageDurations.normal());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> createDownloadsDirectory() async {
    final appDownloadsDirectory = Directory("/storage/emulated/0/Download/");
    if (!await appDownloadsDirectory.exists()) {
      await appDownloadsDirectory.create(recursive: true);
    }
  }

  Future<void> downloadTemplate() async {
    await createDownloadsDirectory();

    String directory = '/storage/emulated/0/Download/';

    final fileName = "${DateTime.now().microsecondsSinceEpoch}qrmenu.png";

    _screenshotController
        .captureAndSave(directory, fileName: fileName)
        .then((value) => Fluttertoast.showToast(msg: "Saved to $directory"));
  }
}
