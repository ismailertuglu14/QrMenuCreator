import 'package:flutter/material.dart';

part '../viewmodel/feed_back_view_model.dart';

class FeedBackView extends StatefulWidget {
  const FeedBackView({super.key});

  @override
  State<FeedBackView> createState() => _FeedBackViewState();
}

class _FeedBackViewState extends FeedbackViewModel {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
