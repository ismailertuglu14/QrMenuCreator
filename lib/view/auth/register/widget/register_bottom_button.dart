import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrmenu/core/extension/router_extension.dart';

import '../../../../core/constans/enum/route_keys.dart';

class RegisterBottomButton extends StatelessWidget {
  const RegisterBottomButton({
    super.key,
  });
  final String _login = "Login now!";
  final String _account = "Do you have an account ? ";

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => context.go(RouterKeys.LOGIN.route),
        child: Text.rich(
          TextSpan(
            text: _account,
            children: [
              TextSpan(
                  text: _login,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary))
            ],
          ),
        ));
  }
}
