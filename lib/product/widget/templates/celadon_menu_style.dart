// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/durations.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:qrmenu/product/widget/video_player.dart';
import 'package:qrmenu/view/pages/templates/model/base_template_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utility/page_padding.dart';

class CeladonMenuStyle extends StatefulWidget {
  const CeladonMenuStyle({super.key, required this.model});
  final BaseTemplateModel model;

  @override
  State<CeladonMenuStyle> createState() => _CeladonMenuStyleState();
}

class _CeladonMenuStyleState extends State<CeladonMenuStyle> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _scrollToCategory() {
    _scrollController.animateTo(0,
        duration: PageDurations.low(), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: DrawerMenu(widget: widget, scaffoldKey: scaffoldKey),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.model.categories.length,
                  padding: PagePadding.allLow(),
                  gridDelegate: PageGridDelegates.normal(),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _scrollToCategory(),
                        child: Column(
                          children: [
                            Expanded(
                                flex: 8,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: (widget.model.categories[index]
                                                  .image ==
                                              null ||
                                          widget.model.categories[index].image!
                                              .isEmpty)
                                      ? ImageKeys.default_image
                                          .imageAsset(fit: BoxFit.cover)
                                      : Image.network(
                                          widget.model.categories[index].image!,
                                          fit: BoxFit.cover),
                                )),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  widget.model.categories[index].name
                                      .toUpperCase(),
                                  style: TextStyle(
                                      fontSize:
                                          context.text.titleLarge?.fontSize)),
                            )
                          ],
                        ),
                      )),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: PagePadding.allMedium(),
                child: CommonTextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                  ],
                  hintText: "MENÜDE ARA...",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => scaffoldKey.currentState?.openDrawer(),
                      child: Container(
                        color: context.colorScheme.primary.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Padding(
                                padding: PagePadding.allDefault(),
                                child: Text(
                                  'MENÜ İÇİN BURAYA TIKLA',
                                  style: TextStyle(
                                    fontSize:
                                        context.text.headlineSmall?.fontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 9,
                    child: Scrollbar(
                      child: ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          padding: PagePadding.allDefault(),
                          itemCount: widget.model.products.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          clipBehavior: Clip.antiAlias,
                                          child: SizedBox(
                                            height: context.height * 0.6,
                                            width: context.width * 0.8,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: PageView.builder(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder: (context,
                                                            index) =>
                                                        CommonVideoPlayer(
                                                            url:
                                                                "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
                                                    itemCount: 5,
                                                  ),
                                                ),
                                                AnimatedSmoothIndicator(
                                                  activeIndex: 2,
                                                  count: 5,
                                                  effect: ScrollingDotsEffect(
                                                      dotHeight: 2,
                                                      dotWidth: 20,
                                                      dotColor: context
                                                          .colorScheme.primary,
                                                      activeDotColor: context
                                                          .colorScheme
                                                          .secondary),
                                                ),
                                                Expanded(
                                                    flex: 5,
                                                    child: Padding(
                                                      padding:
                                                          PagePadding.allLow(),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                widget
                                                                    .model
                                                                    .products[
                                                                        index]
                                                                    .name
                                                                    .toUpperCase(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize: context
                                                                        .text
                                                                        .headlineSmall
                                                                        ?.fontSize),
                                                              ),
                                                              Card(
                                                                  color: context
                                                                      .colorScheme
                                                                      .primary,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        PagePadding
                                                                            .allLow(),
                                                                    child: Text(
                                                                      "New",
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                          Text(
                                                            widget
                                                                .model
                                                                .products[index]
                                                                .description,
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: context
                                                                    .text
                                                                    .titleMedium
                                                                    ?.fontSize),
                                                          ),
                                                          Text(
                                                            " ${widget.model.products[index].price.toString()} ₺",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: context
                                                                    .text
                                                                    .titleLarge
                                                                    ?.fontSize),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Column(
                                                                children: [
                                                                  ImageKeys.milk
                                                                      .imageAsset(
                                                                          width:
                                                                              context.width * 0.1),
                                                                  Text(
                                                                      "Süt ürünleri",
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: context
                                                                              .text
                                                                              .bodySmall
                                                                              ?.fontSize))
                                                                ],
                                                              ),
                                                              ImageKeys.hot.imageAsset(
                                                                  width: context
                                                                          .width *
                                                                      0.1),
                                                              ImageKeys.gluten
                                                                  .imageAsset(
                                                                      width: context
                                                                              .width *
                                                                          0.1),
                                                              ImageKeys.celery
                                                                  .imageAsset(
                                                                      width: context
                                                                              .width *
                                                                          0.1),
                                                              ImageKeys
                                                                  .sulphurdioxide
                                                                  .imageAsset(
                                                                      width: context
                                                                              .width *
                                                                          0.1),
                                                              ImageKeys.soybean
                                                                  .imageAsset(
                                                                      width: context
                                                                              .width *
                                                                          0.1),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        )),
                                child: Card(
                                  color: context.colorScheme.surface,
                                  child: Padding(
                                    padding: PagePadding.allDefault(),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Card(
                                              clipBehavior: Clip.antiAlias,
                                              child: (widget
                                                              .model
                                                              .products[index]
                                                              .images ==
                                                          null ||
                                                      widget
                                                          .model
                                                          .products[index]
                                                          .images!
                                                          .isEmpty)
                                                  ? ImageKeys.default_image
                                                      .imageAsset(
                                                          fit: BoxFit.cover)
                                                  : Image.network(
                                                      widget
                                                          .model
                                                          .products[index]
                                                          .images!
                                                          .first,
                                                      fit: BoxFit.cover,
                                                      height: context.height *
                                                          0.15)),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Padding(
                                            padding: PagePadding.allDefault(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    widget.model.products[index]
                                                        .name,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: context
                                                            .text
                                                            .titleLarge
                                                            ?.fontSize,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                    widget.model.products[index]
                                                        .description,
                                                    style: TextStyle(
                                                        fontSize: context
                                                            .text
                                                            .titleLarge
                                                            ?.fontSize,
                                                        color: Colors.black,
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                                Text(
                                                    "${widget.model.products[index].price} ₺",
                                                    style: TextStyle(
                                                        fontSize: context
                                                            .text
                                                            .titleLarge
                                                            ?.fontSize,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
    required this.widget,
    required this.scaffoldKey,
  });

  final CeladonMenuStyle widget;

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: DrawerHeader(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserCircleAvatar(
                    backgroundImage: ImageKeys.default_image.assetImage()),
                Padding(
                  padding: PagePadding.allDefault(),
                  child: Text(
                    LocaleStorage.instance
                        .getStringValue(LocaleKeys.BUSINESS_NAME),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.text.titleLarge?.fontSize),
                  ),
                )
              ],
            )),
          ),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: ListView.builder(
                      padding: PagePadding.horizontalHeight(),
                      itemCount: widget.model.categories.length,
                      itemBuilder: (context, index) => Padding(
                            padding: PagePadding.verticalDefault(),
                            child: OutlinedButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Padding(
                                  padding: PagePadding.allHeight(),
                                  child: Text(widget
                                      .model.categories[index].name
                                      .toUpperCase()),
                                )),
                          )),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => scaffoldKey.currentState?.closeDrawer(),
                    child: Container(
                      color: context.colorScheme.primary.withOpacity(0.5),
                      child: Column(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Padding(
                              padding: PagePadding.allDefault(),
                              child: Text(
                                'MENÜYE DÖN',
                                style: TextStyle(
                                  fontSize:
                                      context.text.headlineSmall?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
