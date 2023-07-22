import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/regex/email_regex.dart';
import 'package:qrmenu/product/regex/first_name_regex.dart';
import 'package:qrmenu/product/regex/last_name_regex.dart';
import 'package:qrmenu/product/regex/phone_regex.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';
import 'package:qrmenu/view/auth/login/model/get_business_response_model.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/add_media_link_keys.dart';
import '../../../../core/constans/enum/gender_keys.dart';
import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/upload_file_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';

import '../../../../core/init/provider/edit_business_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/close_keyboard.dart';
import '../../../../product/widget/countrycodepicker/country_code_picker.dart';
import '../../../../product/widget/upload_file_dialog.dart';
import '../../../../product/widget/user_circle_avatar.dart';

import '../../locationpicker/service/LocationPicker_service.dart';
import '../model/change_cover_image_response_model.dart';
import '../../socialmedias/model/change_social_media_request_model.dart';
import '../../socialmedias/model/change_social_media_response_model.dart';
import '../model/remove_cover_image_response_model.dart';
import '../model/update_business_response_model.dart';
import '../service/EditBusiness_service.dart';

import 'package:latlong2/spline.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: const CommonAppBar(title: Text("Edit Business")),
      body: CloseKeyboard(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Consumer<EditBusinessProvider>(
                      builder: (context, provider, child) => Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: PageBorderRadius.allMedium()),
                          width: context.width * 0.3,
                          height: context.height * 0.15,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                child: Consumer<EditBusinessProvider>(
                                  builder: (context, provider, child) =>
                                      UserCircleAvatar(
                                    maxRadius: 40,
                                    backgroundImage: (LocaleStorage.instance
                                            .getStringValue(
                                                LocaleKeys.COVER_IMAGE)
                                            .isEmpty)
                                        ? ImageKeys.default_image.assetImage()
                                        : NetworkImage(LocaleStorage.instance
                                                .getStringValue(
                                                    LocaleKeys.COVER_IMAGE))
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () => uploadFileDialog(
                                      context,
                                      _imagePicker,
                                      true,
                                      UploadFileTypeKeys.SINGLE_IMAGE,
                                      changeCoverImage),
                                  child: Container(
                                      padding: PagePadding.allMin(),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: context
                                                  .colorScheme.onSecondary,
                                              width: 4),
                                          shape: BoxShape.circle,
                                          color: context.colorScheme.primary),
                                      child: Icon(Icons.edit)),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextButton.icon(
                              onPressed: () => context
                                  .push(RouterKeys.CHANGE_CURRENCY.route),
                              icon: Icon(Icons.monetization_on_outlined),
                              label: Consumer<EditBusinessProvider>(
                                builder: (context, provider, child) => Text(
                                    "Curency: ${provider.currentCurrency == null || provider.currentCurrency!.isEmpty ? "Not selected" : provider.currentCurrency}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                        ),
                        Flexible(
                          child: Consumer<EditBusinessProvider>(
                              builder: (context, provider, child) =>
                                  TextButton.icon(
                                      onPressed: () => context
                                          .push(RouterKeys.SOCIAL_MEDIAS.route),
                                      icon: Icon(Icons.dataset_linked_outlined),
                                      label: Text(
                                        "Social Media Links",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))),
                        ),
                        Flexible(
                          child: TextButton.icon(
                              onPressed: () => context
                                  .push(RouterKeys.LOCATION_PICKER.route),
                              icon: Icon(Icons.maps_home_work_outlined),
                              label: Consumer<EditBusinessProvider>(
                                builder: (context, provider, child) => Text(
                                    provider.currentLocationName == null
                                        ? "Location: Not selected"
                                        : provider.currentLocationName ??
                                            "Unknown",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: PagePadding.allMedium(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: PagePadding.verticalMedium(),
                        child: Row(children: [
                          Expanded(
                              flex: 1, child: Icon(Icons.info_outline_rounded)),
                          Expanded(
                            flex: 9,
                            child: Padding(
                              padding: PagePadding.horizontalMedium(),
                              child: Text(
                                "While applying the logo changes instantly, you need to click the save button to update your other information.",
                                style: TextStyle(
                                    fontSize:
                                        context.text.titleSmall?.fontSize),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: PagePadding.verticalMedium(),
                        child: CommonTextField(
                          textController: _businessNameController,
                          keyboardType: TextInputType.name,
                          label: Text("Business Name"),
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icon(Icons.business_outlined),
                        ),
                      ),
                      Padding(
                        padding: PagePadding.verticalMedium(),
                        child: CommonTextField(
                          textController: _emailController,
                          label: Text("Email"),
                          textInputAction: TextInputAction.done,
                          prefixIcon: Icon(Icons.alternate_email_rounded),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      Padding(
                        padding: PagePadding.verticalMedium(),
                        child: CommonTextField(
                            prefixIcon: CountryCodePicker(
                              onChanged: (value) => _editBusinessProvider
                                  .changeSelectedCountryCode(value),
                              initialSelection: LocaleStorage.instance
                                  .getStringValue(
                                      LocaleKeys.PHONE_COUNTRY_CODE),
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                            ),
                            label: Text("Phone Number"),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.done,
                            textController: _phoneNumberController),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CommonElevationButton(
                              child: Padding(
                                padding: PagePadding.allHeight(),
                                child: Text("Save"),
                              ),
                              onPressed: () => updateBusiness(),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
