import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/cache/locale_keys_enum.dart';
import 'package:qrmenu/core/constans/enum/route_keys.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/cache/local_storage.dart';
import 'package:qrmenu/core/init/network/network_manager.dart';
import 'package:qrmenu/core/init/provider/delete_business_provider.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/product/widget/elevation_button.dart';
import 'package:qrmenu/product/widget/text_field.dart';
import 'package:qrmenu/view/pages/deletebusiness/service/DeleteBusiness_service.dart';

import '../../../../product/widget/close_keyboard.dart';
import '../model/delete_business_request_model.dart';
import '../model/delete_business_response_model.dart';

part '../viewmodel/delete_business_view_model.dart';

class DeleteBusinessView extends StatefulWidget {
  const DeleteBusinessView({super.key});

  @override
  State<DeleteBusinessView> createState() => DeleteBusinessViewState();
}

class DeleteBusinessViewState extends DeleteBusinessViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        title: Text("Delete Business"),
      ),
      body: CloseKeyboard(
        child: Padding(
          padding: PagePadding.allDefault(),
          child: Consumer<DeleteBusinessProvider>(
            builder: (context, provider, child) => Padding(
              padding: PagePadding.allMedium(),
              child: Column(
                children: [
                  Padding(
                    padding: PagePadding.verticalHight(),
                    child: Text(
                        "We're sorry to see you go Once you delete your account, your profile and username are permanently removed from Reddit and your posts, comments, and messages are disassociated (not deleted) from your account unless you delete them beforehand.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.text.titleMedium?.fontSize)),
                  ),
                  Padding(
                    padding: PagePadding.verticalHight(),
                    child: CommonTextField(
                      obscureText: provider.hidePassword,
                      hintText: "Enter your Password",
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: IconButton(
                          onPressed: () => provider.changeHidePassword(),
                          icon: Icon(provider.hidePassword
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded)),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    value: provider.isConfirm,
                    controlAffinity: ListTileControlAffinity.leading,
                    title:
                        Text("I understand that this action is irreversible."),
                    onChanged: (value) => provider.changeConfirm(value!),
                  ),
                  Padding(
                    padding: PagePadding.verticalHight(),
                    child: Row(
                      children: [
                        Expanded(
                          child: CommonElevationButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: provider.isConfirm
                                  ? context.colorScheme.error
                                  : context.colorScheme.onSecondary,
                              disabledBackgroundColor:
                                  context.colorScheme.surface.withOpacity(0.1),
                            ),
                            onPressed: provider.isConfirm
                                ? () => deleteBusiness()
                                : null,
                            child: Padding(
                              padding: PagePadding.allMedium(),
                              child: Text("Confirm deletion"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
