import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/asset_image_extension.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import '../../../../../product/widget/elevation_button.dart';
import '../../../../core/constans/cache/locale_keys_enum.dart';
import '../../../../core/constans/enum/image_keys.dart';

import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/register_stepper_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../core/init/cache/local_storage.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../../core/init/provider/register_provider.dart';
import '../../../../core/init/router/router_manager.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/text_form_field.dart';
import '../../login/model/get_business_response_model.dart';
import '../../login/service/email/Login_service.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';
import '../service/RegisterService.dart';
import '../widget/privacy_policy_button.dart';
import '../widget/register_account_step.dart';
import '../widget/register_bottom_button.dart';
import '../widget/register_confirmation_step.dart';
import '../widget/register_personel_step.dart';

part '../viewmodel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
  final String _personel = "Personel";
  final String _account = "Account";
  final String _userName = "Username";
  final String _confirmation = "Confirmation";
  final String _login = "Register with email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          width: context.width,
          child: Padding(
            padding: const PagePadding.spesificAuth(),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const PagePadding.allHeight(),
                    child: ImageKeys.register.imageAsset(),
                  ),
                ),
                Expanded(
                    flex: 7,
                    child: Center(
                      child: Consumer<RegisterProvider>(
                        builder: (context, value, child) => Stepper(
                            currentStep: value.currentStep,
                            type: StepperType.horizontal,
                            controlsBuilder: _controlsBuilder,
                            onStepCancel: () => value.onStepCancel(),
                            onStepContinue: () => value.onStepContinue(),
                            onStepTapped: (_) => value.changeCurrentStep(_),
                            physics: const NeverScrollableScrollPhysics(),
                            steps: [
                              _registerStepBuilder(
                                  _personel,
                                  RegisterStepKeys.personel,
                                  RegisterPersonelStep(
                                      contactNumberTextController:
                                          _contactNumberTextController,
                                      businessTextController:
                                          _businessTextController,
                                      registerProvider: _registerProvider)),
                              _registerStepBuilder(
                                  _account,
                                  RegisterStepKeys.account,
                                  RegisterAccountStep(
                                      passwordConfirmTextController:
                                          _passwordConfirmTextController,
                                      emailTextController: _emailTextController,
                                      userName: _userName,
                                      passwordTextController:
                                          _passwordTextController,
                                      registerProvider: _registerProvider)),
                              _registerStepBuilder(
                                  _confirmation,
                                  RegisterStepKeys.confirmation,
                                  RegisterConfirmationStep(
                                      registerProvider: _registerProvider,
                                      register: register)),
                            ]),
                      ),
                    )),
                SizedBox(
                    height: context.height / 25,
                    child: const RegisterBottomButton())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Step _registerStepBuilder(
      String title, RegisterStepKeys state, Widget content) {
    return Step(
        title: Text(title),
        isActive: _registerProvider.isStepActive,
        state: _registerProvider.stepState(state.index),
        content: Form(
          key: _registerProvider.registerFormKeys[state.index],
          autovalidateMode: (state.index < RegisterStepKeys.values.length - 1)
              ? _registerProvider.autoValidateMode
              : AutovalidateMode.disabled,
          child: content,
        ));
  }
}
