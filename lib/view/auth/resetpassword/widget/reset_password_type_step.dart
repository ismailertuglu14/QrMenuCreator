import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/core/extension/lottie_builder_extenson.dart';
import 'package:qrmenu/core/extension/router_extension.dart';
import 'package:qrmenu/core/init/provider/reset_password_provider.dart';

import '../../../../core/constans/enum/lottie_keys.dart';
import '../../../../core/constans/enum/reset_password_type_keys.dart';
import '../../../../core/constans/enum/route_keys.dart';
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
                      child: TabBar(
                          onTap: (value) {},
                          indicatorColor: context.colorScheme.primary,
                          controller: tabController,
                          tabs: const [
                            Tab(text: "Email"),
                            Tab(text: "Phone"),
                          ]),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {},
                            /*inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelephoneInputFormatter()
                            ],*/
                            enableInteractiveSelection: false,
                            textInputAction: TextInputAction.done,
                            controller: widget.resetTargetTextController,
                            keyboardType: /*false == ResetPasswordTypeKeys.EMAIL
                                ? */
                                TextInputType
                                    .emailAddress /*: TextInputType.number*/,
                            decoration: const InputDecoration(
                                prefixIcon: /*false ==
                                        ResetPasswordTypeKeys.EMAIL
                                    ?*/
                                    Icon(Icons.alternate_email_rounded)
                                /*: DropdownButton(
                                        value: null,
                                        borderRadius: const PageBorderRadius
                                            .allMedium(),
                                        icon: const Icon(
                                            Icons.arrow_drop_down_rounded),
                                        hint: Row(
                                          children: [
                                            ImageKeys.voice_call.imageIcon,
                                            const Padding(
                                              padding:
                                                  PagePadding.allDefault(),
                                              child: Text(
                                                "IDD",
                                              ),
                                            ),
                                          ],
                                        ),
                                        underline: const SizedBox.shrink(),
                                        items: [
                                          DropdownMenuItem(
                                              value: "+90",
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.flag_outlined),
                                                  Text("+90"),
                                                ],
                                              )),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            if (value != null) {}
                                          });
                                        },
                                      ),*/
                                ,
                                hintText: /*false != ResetPasswordTypeKeys.EMAIL
                                    ? "Phone"
                                    :*/
                                    "Email adress",
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always),
                          ),
                        ),
                        Consumer<ResetPasswordProvider>(
                          builder: (context, value, child) => AnimatedContainer(
                              width: value.isLoading == true ? 50 : 0,
                              duration: const PageDurations.min(),
                              child: Lottie.asset(LottieKeys.LOADING.path,
                                  fit: BoxFit.cover, height: 50)),
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
          flex: 1,
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
