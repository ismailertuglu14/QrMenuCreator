import 'package:dio/dio.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/product/regex/email_regex.dart';
import 'package:qrmenu/product/regex/first_name_regex.dart';
import 'package:qrmenu/product/regex/last_name_regex.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/gender_keys.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';

import '../../../../core/init/provider/edit_profile_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/upload_file_dialog.dart';
import '../../../../product/widget/user_circle_avatar.dart';
import '../model/change_banner_image_response_model.dart';
import '../model/change_profile_image_response_model.dart';
import '../model/remove_profile_image_response_model.dart';
import '../model/update_profile_request_model.dart';
import '../service/EditProfile_service.dart';
part '../viewmodel/edit_business_view_model.dart';

class EditBusinessView extends StatefulWidget {
  const EditBusinessView({super.key});

  @override
  State<EditBusinessView> createState() => _EditBusinessViewState();
}

class _EditBusinessViewState extends EditBusinessViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: Text("Edit Business")),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 0,
                  height: context.height * 0.15,
                  width: context.width,
                  child: GestureDetector(
                      onTap: () => uploadFileDialog(context, _imagePicker, true,
                              UploadFileTypeKeys.SINGLE_IMAGE, (
                                  {required Object fileObject}) {
                            return Future.value();
                          }),
                      child: ImageKeys.default_banner
                          .imageAsset(fit: BoxFit.cover))),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Padding(
                    padding: PagePadding.allMin(),
                    child: IconButton(
                      onPressed: () => uploadFileDialog(context, _imagePicker,
                          true, UploadFileTypeKeys.SINGLE_IMAGE, (
                              {required Object fileObject}) {
                        return Future.value();
                      }),
                      icon: Icon(
                        Icons.edit,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  )),
              Positioned(
                top: context.height * 0.1,
                child: UserCircleAvatar(
                    maxRadius: 50,
                    onTap: () => uploadFileDialog(context, _imagePicker, false,
                            UploadFileTypeKeys.SINGLE_IMAGE, (
                                {required Object fileObject}) {
                          return Future.value();
                        }),
                    backgroundImage: ImageKeys.default_cover.assetImage(),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: context.colorScheme.onSecondary,
                                  width: 4),
                              shape: BoxShape.circle,
                              color: context.colorScheme.primary),
                          child: GestureDetector(
                            onTap: () => uploadFileDialog(context, _imagePicker,
                                false, UploadFileTypeKeys.SINGLE_IMAGE, (
                                    {required Object fileObject}) {
                              return Future.value();
                            }),
                            child: Padding(
                              padding: PagePadding.allMin(),
                              child: Icon(Icons.edit),
                            ),
                          )),
                    )),
              ),
            ],
          ),
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: PagePadding.allHeight(),
              child: Column(
                children: [
                  Expanded(
                    child: CommonTextFormField(
                      validator: firstNameRegex,
                      textController: _businessNameController,
                      keyboardType: TextInputType.name,
                      label: "Business Name",
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icon(Icons.business_outlined),
                    ),
                  ),
                  Expanded(
                    child: CommonTextFormField(
                      validator: emailRegex,
                      textController: _emailController,
                      label: "Email",
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icon(Icons.alternate_email_rounded),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Consumer<EditProfileProvider>(
                          builder: (context, provider, child) => Expanded(
                            flex: 3,
                            child: GestureDetector(
                                onTap: () async {
                                  final code = await _countryPicker.showPicker(
                                      context: context);

                                  if (code != null) {
                                    provider.changeSelectedCountryCode(code);
                                  }
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: context.colorScheme.primary,
                                            width: 2),
                                        borderRadius:
                                            PageBorderRadius.allMedium()),
                                    height: context.height / 15,
                                    child: (provider.selectedCountryCode
                                                    ?.flagUri !=
                                                null &&
                                            provider.selectedCountryCode
                                                    ?.flagImagePackage !=
                                                null &&
                                            provider.selectedCountryCode
                                                    ?.dialCode !=
                                                null)
                                        ? Padding(
                                            padding: PagePadding.allMin(),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        PageBorderRadius
                                                            .allMedium(),
                                                    child: Image.asset(
                                                      provider
                                                          .selectedCountryCode!
                                                          .flagUri,
                                                      package: provider
                                                          .selectedCountryCode!
                                                          .flagImagePackage,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    child: Padding(
                                                  padding: PagePadding
                                                      .horizontalMin(),
                                                  child: Text(provider
                                                      .selectedCountryCode!
                                                      .dialCode),
                                                )),
                                              ],
                                            ),
                                          )
                                        : Expanded(
                                            child: Align(
                                            child: Text(
                                              "Select Country Code",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: context
                                                      .colorScheme.surface
                                                      .withOpacity(0.5)),
                                            ),
                                          )),
                                  ),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: CommonTextFormField(
                              hintText: "Phone Number",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter a Phone Number";
                                } else if (!RegExp(
                                        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                    .hasMatch(value)) {
                                  return "Please Enter a Valid Phone Number";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              textController: _countryController),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
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
                      )),
                ],
              ),
            )),
      ]),
    );
  }
}
