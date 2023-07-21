import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/init/network/network_manager.dart';
import 'package:qrmenu/product/widget/app_bar.dart';
import 'package:qrmenu/view/pages/changepassword/model/change_password_request_model.dart';
import 'package:qrmenu/view/pages/changepassword/model/change_password_response_model.dart';
import 'package:qrmenu/view/pages/changepassword/service/ChangePassword_service.dart';

import '../../../../product/utility/page_padding.dart';
import '../../../../product/utility/zoom_tap_animation.dart';
import '../../../../product/widget/close_keyboard.dart';
import '../../../../product/widget/elevation_button.dart';
import '../../../../product/widget/text_field.dart';
part '../viewmodel/change_password_view_model.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => ChangePasswordViewState();
}

class ChangePasswordViewState extends ChangePasswordViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: Text("Change Password")),
      body: CloseKeyboard(
        child: Padding(
          padding: PagePadding.allDefault(),
          child: Card(
            color: context.colorScheme.onSecondary.withOpacity(0.8),
            child: Padding(
              padding: PagePadding.allMedium(),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: PagePadding.allLow(),
                      child: Text(
                        "Reset your password",
                        style: TextStyle(
                            fontSize: context.text.titleLarge?.fontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: PagePadding.allLow(),
                      child: Text(
                        "Your new password must be different from previous used password",
                        style: TextStyle(
                          fontSize: context.text.titleMedium?.fontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: PagePadding.allLow(),
                      child: CommonTextField(
                        hintText: "Old Password",
                        obscureText: true,
                        textController: _oldPasswordController,
                        prefixIcon: Icon(Icons.password_outlined),
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icon(Icons.visibility_rounded),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Padding(
                      padding: PagePadding.allLow(),
                      child: CommonTextField(
                        hintText: "New Password",
                        obscureText: true,
                        textController: _newPasswordController,
                        suffixIcon: Icon(Icons.visibility_rounded),
                        prefixIcon: Icon(Icons.password_outlined),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Padding(
                      padding: PagePadding.allLow(),
                      child: CommonTextField(
                        hintText: "Confirm Password",
                        obscureText: true,
                        textController: _confirmPasswordController,
                        suffixIcon: Icon(Icons.visibility_rounded),
                        prefixIcon: Icon(Icons.password_outlined),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: PagePadding.allLow(),
                            child: ZoomTapAnimation(
                              child: CommonElevationButton(
                                onPressed: () => changePassword(),
                                child: Padding(
                                  padding: PagePadding.allMedium(),
                                  child: Text("Save",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: context
                                              .text.titleMedium?.fontSize)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
