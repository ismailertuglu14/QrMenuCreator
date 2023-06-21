import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/imag_path_extension.dart';
import 'package:qrmenu/product/regex/email_regex.dart';
import 'package:qrmenu/product/regex/password_regex.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';
import 'package:qrmenu/view/auth/login/widget/social_media_buttons.dart';

import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/widget/elevation_button.dart';
import '../widget/do_you_need_help_button.dart';
import '../widget/login_button.dart';
import '../widget/login_email_text_field.dart';
import '../widget/login_password_text_field.dart';

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
          Expanded(flex: 3, child: ImageKeys.login.assetImage()),
          Expanded(
              flex: 4,
              child: Form(
                key: _loginProvider.formKey,
                child: Column(
                  children: [
                    LoginEmailTextField(emailController: _emailController),
                    LoginPasswordTextField(
                        passwordController: _passwordController),
                    LoginButton(),
                    Expanded(flex: 1, child: DoYouNeedHelpButtons())
                  ],
                ),
              )),
          Expanded(flex: 3, child: LoginWithSocialMedia())
        ]),
      ),
    );
  }
}
