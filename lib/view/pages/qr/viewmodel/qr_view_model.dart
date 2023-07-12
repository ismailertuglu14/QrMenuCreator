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
    final downloadsDirectory = await getExternalStorageDirectory();
    final appDownloadsDirectory =
        Directory('${downloadsDirectory!.path}/downloads');
    if (!await appDownloadsDirectory.exists()) {
      await appDownloadsDirectory.create(recursive: true);
    }
  }

  Future downloadTemplate({Widget? bo}) async {
    createDownloadsDirectory();

    final appDocDir =
        (await getExternalStorageDirectories(type: StorageDirectory.downloads))
            ?.first;
    //_screenshotController.captureFromWidget();

    final file = File('$appDocDir/');

    final downloadPath = '$appDocDir/';

    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
  }
}
