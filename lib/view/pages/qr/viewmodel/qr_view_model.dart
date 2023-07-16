part of '../view/qr_view.dart';

abstract class QrViewModel extends State<QrView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final ScreenshotController _screenshotController;
  late final DashboardService _dashboardService;
  late final QrProvider _qrProvider;

  Uint8List? imageFile;
  String? pdfFilePath;

  @override
  void initState() {
    super.initState();

    _dashboardService = DashboardService(NetworkManager.instance.dio);
    _qrProvider = QrProvider.instance;

    _screenshotController = ScreenshotController();
    _animationController = AnimationController(
        vsync: this,
        duration: PageDurations.normal(),
        reverseDuration: PageDurations.normal());
    getMenus();
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

  Future<void> getMenus() async {
    try {
      GetRestaurantMenusResponseModel response =
          await _dashboardService.getRestaurantMenus();

      if (response.isSuccess && response.errors.isEmpty) {
        _qrProvider.changeMenus(response.data);
      } else {
        Fluttertoast.showToast(msg: "Get menus failed");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> downloadTemplate() async {
    if (await Permission.storage.isGranted) {
      await createDownloadsDirectory();

      String directory = '/storage/emulated/0/Download/';

      final fileName = "${DateTime.now().microsecondsSinceEpoch}qrmenu.png";

      _screenshotController
          .captureAndSave(directory, fileName: fileName)
          .then((value) => Fluttertoast.showToast(msg: "Saved to $directory"));
    } else {
      Permission.storage.request();
    }
  }
}
