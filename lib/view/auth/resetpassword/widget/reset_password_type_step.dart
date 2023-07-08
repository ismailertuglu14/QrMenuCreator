import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/reset_password_provider.dart';
import 'package:qrmenu/product/widget/countrycodepicker/country_code_picker.dart';
import 'package:qrmenu/product/widget/text_field.dart';

import '../../../../core/constans/enum/image_keys.dart';
import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/reset_password_type_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
import '../../../../product/utility/border_radius.dart';
import '../../../../product/utility/durations.dart';
import '../../../../product/utility/page_padding.dart';
import '../../../../product/widget/elevation_button.dart';

class ResetPasswordTypeStep extends StatefulWidget {
  const ResetPasswordTypeStep({
    super.key,
    required this.resetTargetTextController,
    required this.checkEmail,
  });

  final TextEditingController resetTargetTextController;
  final Future<void> Function() checkEmail;

  @override
  State<ResetPasswordTypeStep> createState() => _ResetPasswordTypeStepState();
}

class _ResetPasswordTypeStepState extends State<ResetPasswordTypeStep>
    with TickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: ResetPasswordTypeKeys.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Column(children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const PagePadding.verticaLow(),
                      child: Consumer<ResetPasswordProvider>(
                        builder: (context, provider, child) => TabBar(
                            onTap: (value) {
                              provider.changeResetPasswordType(
                                  ResetPasswordTypeKeys.values[value]);
                            },
                            indicatorColor: context.colorScheme.primary,
                            controller: tabController,
                            tabs: const [
                              Tab(text: "Email"),
                              Tab(text: "Phone"),
                            ]),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(
                            child: Consumer<ResetPasswordProvider>(
                                builder: (context, provider, child) =>
                                    CommonTextField(
                                      inputFormatters:
                                          provider.resetPasswordType ==
                                                  ResetPasswordTypeKeys.EMAIL
                                              ? []
                                              : [
                                                  FilteringTextInputFormatter
                                                      .digitsOnly,
                                                  TelephoneInputFormatter()
                                                ],
                                      enableInteractiveSelection: false,
                                      textInputAction: TextInputAction.done,
                                      textController:
                                          widget.resetTargetTextController,
                                      keyboardType:
                                          provider.resetPasswordType ==
                                                  ResetPasswordTypeKeys.EMAIL
                                              ? TextInputType.emailAddress
                                              : TextInputType.number,
                                      prefixIcon: provider.resetPasswordType ==
                                              ResetPasswordTypeKeys.EMAIL
                                          ? Icon(Icons.alternate_email_rounded)
                                          : CountryCodePicker(
                                              onChanged: print,
                                              initialSelection: 'IT',
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              alignLeft: false,
                                            ),
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      hintText: provider.resetPasswordType !=
                                              ResetPasswordTypeKeys.EMAIL
                                          ? "Phone"
                                          : "Email adress",
                                    ))),
                        Consumer<ResetPasswordProvider>(
                          builder: (context, value, child) => AnimatedContainer(
                            width: value.isLoading == true ? 50 : 0,
                            duration: const PageDurations.low(),
                            child: LottieKeys.loading
                                .path(fit: BoxFit.cover, height: 50),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                  child: CommonElevationButton(
                      onPressed: () => widget.checkEmail(),
                      child: const Padding(
                        padding: PagePadding.allHeight(),
                        child: Text("Sıfırlama bağlantısı gönder"),
                      ))),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: TextButton(
              onPressed: () => context.go(RouterKeys.LOGIN.route),
              child: Text.rich(
                TextSpan(
                  text: "Remember password ? ",
                  children: [
                    TextSpan(
                        text: "Log in!",
                        style: TextStyle(color: context.colorScheme.primary)),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}

class TelephoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final sanitizedText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    var formattedText = '';
    var index = 0;

    // Format the telephone number in the desired format (e.g., XXX-XXX-XXXX)
    while (index < sanitizedText.length) {
      if (index + 3 <= sanitizedText.length) {
        formattedText += '${sanitizedText.substring(index, index + 3)}-';
        index += 3;
      } else {
        formattedText += sanitizedText.substring(index);
        break;
      }
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}
