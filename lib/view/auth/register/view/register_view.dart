import 'package:flutter/material.dart';

part '../viewmodel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
