import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void copyClipboard(BuildContext context, String content) {
  Clipboard.setData(ClipboardData(text: content));
  Fluttertoast.showToast(msg: "Panoya kopyalandı");
}
