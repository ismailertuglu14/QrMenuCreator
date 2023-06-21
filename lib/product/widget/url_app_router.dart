import 'package:url_launcher/url_launcher_string.dart';

Future<void> urlAppRouter(String url) async {
  if (!await launchUrlString(
    url,
    mode: LaunchMode.platformDefault,
  )) {
    throw Exception('Could not launch $url');
  }
}
/*

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }*/