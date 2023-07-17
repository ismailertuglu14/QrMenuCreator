import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/view/pages/socialmedias/service/SocialMedias_service.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../product/utility/page_padding.dart';
import '../model/change_social_media_request_model.dart';
import '../model/change_social_media_response_model.dart';

part '../viewmodel/social_medias_view_model.dart';

class SocialMediasView extends StatefulWidget {
  const SocialMediasView({Key? key}) : super(key: key);

  @override
  State<SocialMediasView> createState() => _SocialMediasViewState();
}

class _SocialMediasViewState extends SocialMediasViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(
        title: Text("Social Medias"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 1.1,
          width: context.width,
          child: Padding(
            padding: PagePadding.allMedium(),
            child: Column(children: [
              SocialMediaFieldBuilder(
                  label: "Instagram",
                  icon: ImageKeys.instagram,
                  textController: _instagramController),
              SocialMediaFieldBuilder(
                  label: "Facebook",
                  icon: ImageKeys.facebook,
                  textController: _facebookController),
              SocialMediaFieldBuilder(
                  label: "Twitter",
                  icon: ImageKeys.twitter,
                  textController: _twitterController),
              SocialMediaFieldBuilder(
                  label: "Threads",
                  icon: ImageKeys.threads,
                  textController: _threadsController),
              SocialMediaFieldBuilder(
                  label: "Whatsapp",
                  icon: ImageKeys.whatsapp,
                  textController: _whatsappController),
              SocialMediaFieldBuilder(
                  label: "Website",
                  icon: ImageKeys.website,
                  textController: _websiteController),
              Row(
                children: [
                  Expanded(
                    child: CommonElevationButton(
                      child: Padding(
                        padding: PagePadding.allMedium(),
                        child: Text("Save"),
                      ),
                      onPressed: () => addSocialMedia(),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class SocialMediaFieldBuilder extends StatelessWidget {
  const SocialMediaFieldBuilder({
    super.key,
    required this.label,
    required this.icon,
    required this.textController,
  });
  final String label;
  final ImageKeys icon;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.verticalHight(),
      child: CommonTextField(
        label: Text(label),
        prefixIcon: Padding(
          padding: PagePadding.allDefault(),
          child: icon.imageAsset(width: context.width * 0.1),
        ),
        textController: textController,
        suffixIcon: const Icon(Icons.link_outlined),
        keyboardType: TextInputType.url,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
