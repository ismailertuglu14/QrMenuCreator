// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

Future<void> emailAppRouter() async {
  const emailUrl =
      "mailto:${"gorillaredevs@gmail.com"}?subject=${""}&body=${"Hi,"}";
  if (await launch(emailUrl)) {
    await launch(emailUrl);
  } else {
    throw 'Could not launch';
  }
}
