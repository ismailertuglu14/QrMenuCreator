part of '../view/templates_view.dart';

abstract class TemplatesViewModel extends State<TemplatesView>
    with SingleTickerProviderStateMixin {
  late final TemplatesProvider _templatesProvider;

  @override
  void initState() {
    super.initState();
    _templatesProvider = TemplatesProvider.instance;
  }
}
