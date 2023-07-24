import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/constans/enum/image_keys.dart';
import '../../../view/pages/templates/model/base_template_model.dart';
import '../../utility/durations.dart';
import '../template_file_preview.dart';
import '../video_player.dart';

class FulvousMenuStyle extends StatefulWidget {
  const FulvousMenuStyle({super.key, required this.model});
  final BaseTemplateModel? model;

  @override
  State<FulvousMenuStyle> createState() => _FulvousMenuStyleState();
}

class _FulvousMenuStyleState extends State<FulvousMenuStyle> {
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
        body: Column(
      children: [
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
          child: ListView.builder(
              controller: _scrollController,
              padding: PagePadding.allDefault(),
              itemCount: widget.model!.products.length,
              itemBuilder: (context, index) => index == 0
                  ? Container(
                      color: Colors.amber,
                      height: context.height * 0.05,
                      child: Center(
                          child: Text(
                        "Salatalar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.text.titleLarge?.fontSize),
                      )),
                    )
                  : GestureDetector(
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
                                        flex: 6,
                                        child: TemplateFilePreview(
                                            files: widget.model!.products[index]
                                                .image),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: PagePadding.allLow(),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      widget.model!
                                                          .products[index].name
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: context
                                                              .text
                                                              .headlineSmall
                                                              ?.fontSize),
                                                    ),
                                                    widget
                                                            .model!
                                                            .products[index]
                                                            .isNew
                                                        ? Card(
                                                            color: context
                                                                .colorScheme
                                                                .primary,
                                                            child: Padding(
                                                              padding:
                                                                  PagePadding
                                                                      .allLow(),
                                                              child: Text(
                                                                "New",
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ))
                                                        : SizedBox.shrink(),
                                                  ],
                                                ),
                                                Text(
                                                  widget.model!.products[index]
                                                      .description,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: context
                                                          .text
                                                          .titleMedium
                                                          ?.fontSize),
                                                ),
                                                Text(
                                                  " ${widget.model!.products[index].price.toString()} ₺",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: context
                                                          .text
                                                          .titleLarge
                                                          ?.fontSize),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: const [
                                                    ProductAllergensBuilder(
                                                        image: ImageKeys.milk,
                                                        titile:
                                                            "Milk products"),
                                                    ProductAllergensBuilder(
                                                        image: ImageKeys.hot,
                                                        titile: "Hot food"),
                                                    ProductAllergensBuilder(
                                                        image: ImageKeys.gluten,
                                                        titile: "Gluten"),
                                                    ProductAllergensBuilder(
                                                        image:
                                                            ImageKeys.soybean,
                                                        titile: "Soybean"),
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
                        color: context.colorScheme.surface.withOpacity(0.15),
                        child: Padding(
                          padding: PagePadding.allDefault(),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child:
                                        (
                                                widget.model!.products[index]
                                                    .image.isEmpty)
                                            ? ImageKeys.default_image
                                                .imageAsset(fit: BoxFit.cover)
                                            : Image.network(
                                                widget.model!.products[index]
                                                    .image.first,
                                                fit: BoxFit.cover,
                                                height: context.height * 0.15)),
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
                                      Padding(
                                        padding: PagePadding.verticalDefault(),
                                        child: Text(
                                            widget.model!.products[index].name,
                                            style: TextStyle(
                                                color:
                                                    context.colorScheme.surface,
                                                fontSize: context
                                                    .text.titleLarge?.fontSize,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                          widget.model!.products[index]
                                              .description,
                                          style: TextStyle(
                                              fontSize: context
                                                  .text.titleLarge?.fontSize,
                                              color:
                                                  context.colorScheme.surface,
                                              overflow: TextOverflow.ellipsis)),
                                      Padding(
                                        padding: PagePadding.verticalDefault(),
                                        child: Text(
                                            "${widget.model!.products[index].price} ₺",
                                            style: TextStyle(
                                                fontSize: context
                                                    .text.titleLarge?.fontSize,
                                                color:
                                                    context.colorScheme.surface,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
        )
      ],
    ));
  }
}

class ProductAllergensBuilder extends StatelessWidget {
  const ProductAllergensBuilder({
    super.key,
    required this.image,
    required this.titile,
  });
  final ImageKeys image;
  final String titile;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image.imageAsset(width: context.width * 0.1),
        Text(titile,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: context.text.bodySmall?.fontSize))
      ],
    );
  }
}
