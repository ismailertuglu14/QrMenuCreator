import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

import '../../../../core/constans/enum/add_media_link_keys.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/init/provider/edit_business_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_field.dart';

class AddBusinessMediaLinkSheet extends StatelessWidget {
  const AddBusinessMediaLinkSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allDefault(),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: CommonTextField(
                  prefixIcon: Padding(
                    padding: PagePadding.allDefault(),
                    child: Consumer<EditBusinessProvider>(
                      builder: (context, provider, child) => DropdownButton(
                        value: provider.selectedAddMediaType,
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
                  ),
                  hintText: "Website or Social Media Link",
                  suffixIcon:
                      TextButton(onPressed: () {}, child: Text("Add")))),
          Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => ListTile(
                    contentPadding: PagePadding.allLow(),
                    onTap: () {},
                    title: Text("https://www.instagram.com/qrmenu/"),
                    leading: ImageKeys.instagram.imageAsset()),
              ))
        ],
      ),
    );
  }

  DropdownMenuItem<dynamic> addBusinessMediaLinkIconBuilder(
      BuildContext context, ImageKeys imageKeys, AddMediaLinkKeys value) {
    return DropdownMenuItem(
        value: value,
        alignment: Alignment.center,
        child: imageKeys.imageAsset(width: context.width / 10));
  }
}
