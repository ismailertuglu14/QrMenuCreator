part of '../view/social_medias_view.dart';

abstract class SocialMediasViewModel extends State<SocialMediasView> {
  late final TextEditingController _instagramController;
  late final TextEditingController _facebookController;
  late final TextEditingController _twitterController;
  late final TextEditingController _threadsController;
  late final TextEditingController _whatsappController;
  late final TextEditingController _websiteController;
  late final SocialMediasService _socialMediasService;
  @override
  void initState() {
    super.initState();
    _socialMediasService = SocialMediasService(NetworkManager.instance.dio);
    _instagramController = TextEditingController();
    _facebookController = TextEditingController();
    _twitterController = TextEditingController();
    _threadsController = TextEditingController();
    _whatsappController = TextEditingController();
    _websiteController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  @override
  void dispose() {
    _instagramController.dispose();
    _facebookController.dispose();
    _twitterController.dispose();
    _threadsController.dispose();
    _whatsappController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void init() {
    _instagramController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.INSTAGRAM);
    _facebookController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.FACEBOOK);

    _twitterController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.TWITTER);

    _threadsController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.THREADS);

    _whatsappController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.WHATSAPP);
    _websiteController.text =
        LocaleStorage.instance.getStringValue(LocaleKeys.WEBSITE);
  }

  Future<void> addSocialMedia() async {
    {
      try {
        ChangeSocialMediaResponseModel response =
            await _socialMediasService.addSocialMedia(
                requestModel: ChangeSocialMediaRequestModel(
          instagram: _instagramController.text,
          twitter: _twitterController.text,
          facebook: _facebookController.text,
          website: _websiteController.text,
          whatsapp: _whatsappController.text,
        ));
        if (response.isSuccess && response.errors.isEmpty) {
          LocaleStorage.instance
              .setStringValue(LocaleKeys.INSTAGRAM, response.data.instagram);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.FACEBOOK, response.data.facebook);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.TWITTER, response.data.twitter);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.THREADS, response.data.threads);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.WHATSAPP, response.data.whatsapp);
          LocaleStorage.instance
              .setStringValue(LocaleKeys.WEBSITE, response.data.website);
          Fluttertoast.showToast(msg: "Social media added successfully");
        } else {
          Fluttertoast.showToast(msg: response.errors.first);
        }
      } catch (e) {
        throw UnimplementedError(e.toString());
      }
    }
  }
}
