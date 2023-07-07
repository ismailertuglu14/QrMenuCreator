import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

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

import '../../../../core/init/provider/edit_business_provider.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/app_bar.dart';
import '../../../../product/widget/countrycodepicker/country_code_picker.dart';
import '../../../../product/widget/upload_file_dialog.dart';
import '../../../../product/widget/user_circle_avatar.dart';
import '../model/change_banner_image_response_model.dart';
import '../model/change_cover_image_response_model.dart';
import '../model/remove_cover_image_response_model.dart';
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
      appBar: const CommonAppBar(title: Text("Edit Business")),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                Positioned(
                    top: 0,
                    height: context.height * 0.15,
                    width: context.width,
                    child:
                        ImageKeys.default_banner.imageAsset(fit: BoxFit.cover)),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Padding(
                      padding: PagePadding.allMin(),
                      child: IconButton(
                        onPressed: () => uploadFileDialog(
                            context,
                            _imagePicker,
                            true,
                            UploadFileTypeKeys.SINGLE_IMAGE,
                            changeCoverImage),
                        icon: Icon(
                          Icons.edit,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    )),
                Positioned(
                  top: context.height * 0.1,
                  child: Consumer<EditBusinessProvider>(
                    builder: (context, provider, child) => UserCircleAvatar(
                        maxRadius: 50,
                        backgroundImage: ImageKeys.default_image.assetImage(),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () => uploadFileDialog(context, _imagePicker,
                                false, UploadFileTypeKeys.SINGLE_IMAGE, (
                                    {required Object fileObject}) {
                              return Future.value();
                            }),
                            child: Container(
                                padding: PagePadding.allMin(),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: context.colorScheme.onSecondary,
                                        width: 4),
                                    shape: BoxShape.circle,
                                    color: context.colorScheme.primary),
                                child: Icon(Icons.edit)),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: PagePadding.allHeight(),
              child: Column(children: [
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
                  child: CommonTextFormField(
                      prefixIcon: CountryCodePicker(
                        onChanged: (value) => _editBusinessProvider
                            .changeSelectedCountryCode(value),
                        initialSelection: 'IT',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      label: "Phone Number",
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
                ),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      (_editBusinessProvider.currentLocation != null &&
                              _editBusinessProvider.currentLocationName != null)
                          ? "${_editBusinessProvider.currentLocationName}"
                          : "No Location Selected",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Expanded(
                      child: CommonElevationButton(
                        child: Text("Change location"),
                        onPressed: () =>
                            context.push(RouterKeys.LOCATION_PICKER.route),
                      ),
                    ),
                  ],
                )),
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
