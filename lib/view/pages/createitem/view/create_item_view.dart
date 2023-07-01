import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/utility/border_radius.dart';
import 'package:qrmenu/product/utility/grid_delegates.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/upload_file_dialog.dart';
import 'package:qrmenu/product/widget/user_circle_avatar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../model/allergens_model.dart';
import '../../../../product/widget/item_count_circle.dart';
part '../viewmodel/create_item_view_model.dart';

class CreateItemView extends StatefulWidget {
  const CreateItemView({Key? key}) : super(key: key);

  @override
  State<CreateItemView> createState() => _CreateItemViewState();
}

class _CreateItemViewState extends CreateItemViewModel {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: Text("Create Item"),
        ),
        body: SingleChildScrollView(
            child: SizedBox(
          height: context.height * 1.5,
          width: context.width,
          child: Column(children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: PagePadding.allMedium(),
                  child: ClipRRect(
                    borderRadius: PageBorderRadius.allDefault(),
                    child: GestureDetector(
                      onTap: () => uploadFileDialog(
                          context,
                          _imagePicker,
                          false,
                          UploadFileTypeKeys.SINGLE_IMAGE,
                          ({required fileObject}) => Future.value()),
                      child: Image.network("https://picsum.photos/1920/1080",
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSmoothIndicator(
                effect: WormEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: context.colorScheme.primary),
                activeIndex: 2,
                count: 10),
            Expanded(
              flex: 8,
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonTextField(
                      hintText: "Name",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                    CommonTextField(
                      hintText: "Description",
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                    CreateItemListTileBuilder(
                        onTap: () => showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                  child: Padding(
                                    padding: PagePadding.allMedium(),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Variants",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: context
                                                        .text
                                                        .headlineSmall
                                                        ?.fontSize),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding: PagePadding
                                                    .horizontalHeight(),
                                                child: IconButton(
                                                    onPressed: () =>
                                                        context.pop(),
                                                    icon: Icon(Icons.close)),
                                              )
                                            ],
                                          ),
                                          CommonElevationButton(
                                            child: Text("Save"),
                                            onPressed: () {},
                                          )
                                        ]),
                                  ),
                                )),
                        title: Row(
                          children: const [
                            Text(
                              "Variants",
                            ),
                            ItemCountCircle(count: 26),
                          ],
                        ),
                        traling: Icon(Icons.add_circle_outline_rounded)),
                    Column(children: const [
                      CreateItemSwitchTileBuilder(
                        value: false,
                        title: "Gluten Free",
                        secondary: ImageKeys.gluten_free,
                      ),
                      CreateItemSwitchTileBuilder(
                        value: false,
                        title: "Vegeterian",
                        secondary: ImageKeys.vegeterian,
                      ),
                      CreateItemSwitchTileBuilder(
                        value: false,
                        title: "Vegan",
                        secondary: ImageKeys.vegan,
                      ),
                      CreateItemSwitchTileBuilder(
                          value: false,
                          title: "Lactose Free",
                          secondary: ImageKeys.lactose_free),
                      CreateItemSwitchTileBuilder(
                          value: false,
                          title: "Halal",
                          secondary: ImageKeys.halal),
                    ]),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => Dialog(
                                child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: Wrap(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Nutrition Facts",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: context.text
                                                  .headlineSmall?.fontSize),
                                        ),
                                        IconButton(
                                            onPressed: () => context.pop(),
                                            icon: Icon(Icons.close))
                                      ],
                                    ),
                                    Text(
                                        "Check only if you want to show dietary info with your item"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CommonElevationButton(
                                            child: Text("Save"),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                                ),
                              )),
                      title: Row(children: [
                        Expanded(
                            flex: 4,
                            child: Text(
                              "Nutrition Facts",
                              style: context.text.titleMedium,
                            )),
                        Expanded(
                            flex: 4,
                            child: Text(
                              "25615 kcal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: context.text.titleMedium?.fontSize),
                            )),
                        Expanded(
                          flex: 2,
                          child: Icon(Icons.add_circle_outline_rounded),
                        )
                      ]),
                    ),
                    ListTile(
                      onTap: () => context.push(RouterKeys.ADD_ONS.route),
                      contentPadding: EdgeInsets.zero,
                      trailing: Icon(Icons.add_circle_outline_rounded),
                      title: Row(
                        children: [
                          Text(
                            "Add-Ons",
                            style: context.text.titleMedium,
                          ),
                          ItemCountCircle(count: 5),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text("Allergens",
                                  style: context.text.titleMedium),
                            ),
                            Flexible(
                              child: GridView.builder(
                                shrinkWrap: true,
                                padding: PagePadding.allHeight(),
                                itemCount: allergens.length + 1,
                                scrollDirection: Axis.horizontal,
                                gridDelegate: PageGridDelegates.min(),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () => index != allergens.length
                                        ? showDialog(
                                            context: context,
                                            builder: (context) => Dialog(
                                                  child: Padding(
                                                    padding:
                                                        PagePadding.allMedium(),
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Allergens",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: context
                                                                    .text
                                                                    .headlineSmall
                                                                    ?.fontSize),
                                                          ),
                                                          GridView.builder(
                                                              itemCount:
                                                                  allergens
                                                                      .length,
                                                              shrinkWrap: true,
                                                              padding: PagePadding
                                                                  .allHeight(),
                                                              gridDelegate:
                                                                  PageGridDelegates
                                                                      .ultra(),
                                                              itemBuilder: (context,
                                                                      index) =>
                                                                  Container(
                                                                      width: context
                                                                              .width *
                                                                          0.2,
                                                                      height:
                                                                          context.height *
                                                                              0.1,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: PageBorderRadius
                                                                              .allMedium(),
                                                                          color: context
                                                                              .colorScheme
                                                                              .primary),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(allergens[index]
                                                                              .icon),
                                                                          Text(allergens[index]
                                                                              .name)
                                                                        ],
                                                                      ))),
                                                          Padding(
                                                            padding: PagePadding
                                                                .allMin(),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      CommonElevationButton(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          PagePadding
                                                                              .allMedium(),
                                                                      child: Text(
                                                                          "Add"),
                                                                    ),
                                                                    onPressed:
                                                                        () {},
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: PagePadding
                                                                .allMin(),
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      OutlinedButton(
                                                                          onPressed:
                                                                              () {},
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                PagePadding.allMedium(),
                                                                            child:
                                                                                Text("Cancel"),
                                                                          )),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ]),
                                                  ),
                                                ))
                                        : null,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                PageBorderRadius.allMedium(),
                                            color: index != allergens.length
                                                ? context.colorScheme.primary
                                                : context.colorScheme.surface
                                                    .withOpacity(0.2)),
                                        child: index != allergens.length
                                            ? Icon(allergens[index].icon)
                                            : Icon(Icons.add_rounded)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "USD",
                            style: context.text.titleMedium,
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: CommonTextField(
                            textAlign: TextAlign.center,
                            hintText: "Price",
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                          ),
                        )
                      ],
                    ),
                    SwitchListTile(
                      value: isSwitched,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Active", style: context.text.titleMedium),
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CommonElevationButton(
                            child: Padding(
                              padding: PagePadding.allHeight(),
                              child: Text("Save"),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ]),
        )));
  }
}

class CreateItemListTileBuilder extends StatelessWidget {
  const CreateItemListTileBuilder({
    super.key,
    this.leading,
    this.title,
    this.traling,
    this.onTap,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? traling;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      onTap: onTap,
      title: title,
      trailing: traling,
    );
  }
}

class CreateItemSwitchTileBuilder extends StatelessWidget {
  const CreateItemSwitchTileBuilder({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    required this.secondary,
    this.isThreeLine,
    required this.value,
    this.onChanged,
  });
  final Widget? leading;
  final String title;
  final Widget? subtitle;
  final ImageKeys secondary;
  final bool? isThreeLine;
  final bool value;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: TextStyle(color: context.colorScheme.surface),
      ),
      secondary: secondary.imageAsset(width: context.width * 0.1),
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
