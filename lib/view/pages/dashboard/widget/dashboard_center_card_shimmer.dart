import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';

class DasboardCenterShimmerCard extends StatefulWidget {
  const DasboardCenterShimmerCard(
      {Key? key, required this.index, required this.length})
      : super(key: key);
  final int index;
  final int length;

  @override
  State<DasboardCenterShimmerCard> createState() =>
      _DasboardCenterShimmerCardState();
}

class _DasboardCenterShimmerCardState extends State<DasboardCenterShimmerCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: PageDurations.low(),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        reverseCurve: Curves.linear,
        parent: _animationController,
        curve: Interval(
          widget.index / widget.length,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 1),
          end: Offset.zero,
        ).animate(_animationController),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: PagePadding.allHeight(),
            child: InkWell(
              borderRadius: PageBorderRadius.allHeight(),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: PageBorderRadius.allMedium(),
                    side: BorderSide(
                        style: BorderStyle.solid,
                        color: context.colorScheme.surface.withOpacity(0.5),
                        width: 0.1)),
                child: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: PageBorderRadius.spesificTop(),
                          child: Stack(
                            children: [
                              Container(
                                width: context.width,
                              ),
                              Positioned(
                                right: 20,
                                top: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          PageBorderRadius.allMedium()),
                                  child: Card(
                                    child: Padding(
                                      padding: PagePadding.allMin(),
                                      child: Row(
                                        children: [
                                          Text(
                                            "156 ",
                                            style: TextStyle(
                                                fontSize: context
                                                    .text.titleMedium?.fontSize,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "views",
                                            style: TextStyle(
                                              fontSize: context
                                                  .text.titleMedium?.fontSize,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Padding(
                          padding: PagePadding.horizontalHeight(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                          PageBorderRadius.allHeight()),
                                  child: Text(
                                    "widget.menu.name.toUpperCase",
                                    style: TextStyle(
                                        fontSize:
                                            context.text.titleLarge?.fontSize,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: PopupMenuButton(
                                      itemBuilder: (context) => []))
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 3,
                      child: Row(children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: PageBorderRadius.allMedium()),
                                child: Text(
                                  "00000000000000",
                                  style: TextStyle(
                                    fontSize:
                                        context.text.titleMedium?.fontSize,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: PageBorderRadius.allMedium()),
                                child: Text(
                                  "0000000",
                                  style: TextStyle(
                                      fontSize:
                                          context.text.titleMedium?.fontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: PageBorderRadius.allMedium()),
                                child: Text(
                                  "00000000000000",
                                  style: TextStyle(
                                    fontSize:
                                        context.text.titleMedium?.fontSize,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: PageBorderRadius.allMedium()),
                                child: Text(
                                  "00000",
                                  style: TextStyle(
                                      fontSize:
                                          context.text.titleMedium?.fontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
