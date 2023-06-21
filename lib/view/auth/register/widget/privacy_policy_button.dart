import 'package:flutter/material.dart';

TextButton privacyPolicyButton(BuildContext context) {
  const String privacyPolicy1 =
      "Kayıt olarak bu sözleşmeyi kabul etmiş olursunuz. ";
  const String privacyPolicy2 =
      "Gizlilik Politikası,Kullanım Şartları ve Çerez Politikası";
  return TextButton(
      onPressed: () {},
      child: Text.rich(
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelMedium!.fontSize),
        TextSpan(
          text: privacyPolicy1,
          children: [
            TextSpan(
                text: privacyPolicy2,
                style: TextStyle(color: Theme.of(context).colorScheme.primary))
          ],
        ),
      ));
}
