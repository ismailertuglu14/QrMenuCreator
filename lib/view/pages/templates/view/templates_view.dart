import 'package:flutter/material.dart';

part '../viewmodel/templates_view_model.dart';

class TemplatesView extends StatefulWidget {
  const TemplatesView({super.key});

  @override
  State<TemplatesView> createState() => _TemplatesViewState();
}

class _TemplatesViewState extends TemplatesViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
