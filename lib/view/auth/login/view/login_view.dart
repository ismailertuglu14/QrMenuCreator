import 'package:flutter/material.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/imag_path_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';
import 'package:qrmenu/view/auth/login/widget/social_media_buttons.dart';

import '../../../../product/widget/elevation_button.dart';
import '../widget/do_you_need_help_button.dart';

part '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModels {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: PagePadding.spesificAuth(),
        child: Column(children: [
          Expanded(flex: 4, child: ImageKeys.login.assetImage()),
          Expanded(
              flex: 2,
              child: Form(
                  child: Column(
                children: [
                  Expanded(
                      child: CommonTextFormField(
                    label: "Email",
                    textController: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.alternate_email_rounded),
                  )),
                  Expanded(
                      child: CommonTextFormField(
                    label: "Password",
                    obscureText: true,
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.visibility)),
                    textInputAction: TextInputAction.done,
                    textController: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.password_rounded),
                  ))
                ],
              ))),
          Expanded(flex: 2, child: DoYouNeedHelpButtons()),
          Expanded(flex: 3, child: LoginWithSocialMedia())
        ]),
      ),
    );
  }
}
