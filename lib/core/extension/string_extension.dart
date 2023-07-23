import 'package:easy_localization/easy_localization.dart';

extension ProductTitleExtension on String {
  String constrict() {
    if (length > 20) {
      return '${substring(0, 26)}...';
    }
    return this;
  }
}

extension NullString on String? {
  String get isNull => this ?? '';
}
