import 'package:url_launcher/url_launcher_string.dart';

Future<void> urlAppRouter(String url) async {
  try {
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {}
  } catch (e) {
    throw Exception('Could not launch $url');
  }
}
