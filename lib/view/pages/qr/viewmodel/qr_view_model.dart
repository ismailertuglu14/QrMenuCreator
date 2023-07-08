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
    final pdf = pw.Document();
    pdf.addPage(
      pw.MultiPage(
        build: (pw.Context context) {
          return [];
        },
      ),
    );

    final appDocDir =
        (await getExternalStorageDirectories(type: StorageDirectory.downloads))
            ?.first;

    final file = File('$appDocDir/');

    await file.writeAsBytes(await pdf.save());

    // PDF dosyasını indirin
    final downloadPath = '$appDocDir/';

    /*  await FileDownloader.downloadFile(
        url: appDocDir.toString(),
        
        onProgress: (count, total) {
          print('Downloading: $count/$total');
        });

         final tempDir = await getTemporaryDirectory();
  final tempPath = tempDir.path;
  final pdfFilePath = '$tempPath/qr_menu.pdf';

  final file = File(pdfFilePath);
  await file.writeAsBytes(await pdf.save());

  // PDF dosyasını indir
  await FlutterFileDownloader.downloadFile(pdfFilePath);*/
  }
}
