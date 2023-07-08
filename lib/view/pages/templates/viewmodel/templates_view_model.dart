part of '../view/templates_view.dart';

abstract class TemplatesViewModel extends State<TemplatesView>
    with SingleTickerProviderStateMixin {
  late final TemplatesProvider _templatesProvider;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _templatesProvider = TemplatesProvider.instance;
    _animationController = AnimationController(
        vsync: this,
        duration: PageDurations.normal(),
        reverseDuration: PageDurations.normal());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
