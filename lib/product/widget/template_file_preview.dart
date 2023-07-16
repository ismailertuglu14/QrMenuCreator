import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TemplateFilePreview extends StatefulWidget {
  const TemplateFilePreview({
    super.key,
    required this.files,
  });
  final List<String> files;
  @override
  State<TemplateFilePreview> createState() => _TemplateFilePreviewState();
}

class _TemplateFilePreviewState extends State<TemplateFilePreview> {
  int currentIndex = 0;

  void onPageChanged(int index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 5,
        child: PageView.builder(
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              Image.network(widget.files[index], fit: BoxFit.cover),
          itemCount: widget.files.length,
        ),
      ),
      Expanded(
        flex: 1,
        child: AnimatedSmoothIndicator(
          activeIndex: currentIndex,
          count: widget.files.length,
          effect: ExpandingDotsEffect(
              dotHeight: 2,
              dotWidth: 20,
              dotColor: context.colorScheme.primary,
              activeDotColor: context.colorScheme.secondary),
        ),
      ),
    ]);
  }
}
