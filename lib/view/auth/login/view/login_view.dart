import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/constans/enum/image_keys.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/imag_path_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/product/regex/email_regex.dart';
import 'package:qrmenu/product/regex/password_regex.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_form_field.dart';
import 'package:qrmenu/view/auth/login/widget/social_media_buttons.dart';

import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/login_provider.dart';
import '../../../../product/mixin/cache_init_mixin.dart';
import '../../../../product/widget/elevation_button.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';
import '../service/email/Login_service.dart';
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
          Expanded(
              flex: 3,
              child: Padding(
                padding: PagePadding.allHeight(),
                child: ImageKeys.login.imageAsset(),
              )),
          Expanded(
              flex: 3,
              child: Form(
                key: _loginProvider.formKey,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: LoginEmailTextField(
                            emailController: _emailController)),
                    Expanded(
                      flex: 3,
                      child: LoginPasswordTextField(
                        
                          passwordController: _passwordController),
                    ),
                    Expanded(flex: 2, child: LoginButton(login: login)),
                    Expanded(flex: 2, child: DoYouNeedHelpButtons())
                  ],
                ),
              )),
          Expanded(flex: 3, child: LoginWithSocialMedia())
        ]),
      ),
    );
  }
}
