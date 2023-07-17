import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/add_media_link_keys.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/init/provider/edit_business_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_field.dart';
import '../model/add_social_media_link_model.dart';

class AddBusinessMediaLinkSheet extends StatelessWidget {
  const AddBusinessMediaLinkSheet(
      {Key? key, required this.controller, required this.addSocialMedia})
      : super(key: key);
  final TextEditingController controller;
  final Future<void> Function() addSocialMedia;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Consumer<EditBusinessProvider>(
                builder: (context, provider, child) => CommonTextField(
                    textController: controller,
                    prefixIcon: Padding(
                      padding: PagePadding.allDefault(),
                      child: DropdownButton(
                        value: provider.selectedAddMediaType,
                        alignment: Alignment.center,
                        underline: Container(),
                        borderRadius: PageBorderRadius.allMedium(),
                        items: [
                          addBusinessMediaLinkIconBuilder(context,
                              ImageKeys.instagram, AddMediaLinkKeys.INSTAGRAM),
                          addBusinessMediaLinkIconBuilder(context,
                              ImageKeys.twitter, AddMediaLinkKeys.TWITTER),
                          addBusinessMediaLinkIconBuilder(context,
                              ImageKeys.threads, AddMediaLinkKeys.THREADS),
                          addBusinessMediaLinkIconBuilder(context,
                              ImageKeys.facebook, AddMediaLinkKeys.FACEBOOK),
                          addBusinessMediaLinkIconBuilder(context,
                              ImageKeys.website, AddMediaLinkKeys.WEBSITE),
                        ],
                        onChanged: (value) =>
                            provider.changeSelectedAddMediaType(value),
                      ),
                    ),
                    hintText: "Website or Social Media Link",
                    suffixIcon: provider.isLinkEditing
                        ? SizedBox.shrink()
                        : TextButton(
                            onPressed: () => addSocialMedia(),
                            child: Text("Add"))),
              )),
          Expanded(
              flex: 8,
              child: Consumer<EditBusinessProvider>(
                builder: (context, provider, child) => ListView.builder(
                  itemCount: provider.addedSocialMediaLinks.length,
                  itemBuilder: (context, index) => ListTile(
                      contentPadding: PagePadding.allLow(),
                      trailing: (provider.isLinkEditing &&
                              provider.editingItem ==
                                  provider.addedSocialMediaLinks[index])
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      provider.changeIsLinkEditing(false);
                                      provider.changeSelectedAddMediaType(
                                          AddMediaLinkKeys.WEBSITE);
                                      controller.clear();
                                    },
                                    icon: Icon(Icons.close_rounded)),
                                IconButton(
                                    onPressed: () {
                                      addSocialMedia();
                                      provider.updateSocialMediaLinks(
                                          AddSocialMediaLinkModel(
                                              link: provider.editingItem?.link,
                                              imageKey: provider
                                                  .editingItem!.imageKey,
                                              type:
                                                  provider.editingItem!.type));
                                      provider.changeIsLinkEditing(false);
                                    },
                                    icon: Icon(Icons.check)),
                              ],
                            )
                          : Row(mainAxisSize: MainAxisSize.min, children: [
                              IconButton(
                                  onPressed: () {
                                    provider.changeEditItem(
                                        provider.addedSocialMediaLinks[index]);
                                    provider.changeIsLinkEditing(true);
                                    controller.text = provider
                                        .addedSocialMediaLinks[index].link!;
                                    provider.changeSelectedAddMediaType(provider
                                        .addedSocialMediaLinks[index].type);
                                  },
                                  icon: Icon(Icons.edit_outlined)),
                              IconButton(
                                  onPressed: () =>
                                      provider.removeSocialMediaLinks(provider
                                          .addedSocialMediaLinks[index]),
                                  icon: Icon(Icons.delete_outline_rounded))
                            ]),
                      title: Text(provider.addedSocialMediaLinks[index].link!),
                      leading: provider.addedSocialMediaLinks[index].imageKey
                          .imageAsset()),
                ),
              ))
        ],
      ),
    );
  }
}

DropdownMenuItem<dynamic> addBusinessMediaLinkIconBuilder(
    BuildContext context, ImageKeys imageKeys, AddMediaLinkKeys value) {
  return DropdownMenuItem(
      value: value,
      alignment: Alignment.center,
      child: imageKeys.imageAsset(width: context.width / 10));
}
