part of '../view/qr_view.dart';

abstract class QrViewModel extends State<QrView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: PageDurations.low(),
        reverseDuration: PageDurations.low());
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
