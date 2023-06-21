import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrmenu/core/extension/context_extension.dart';

class RequestTimeoutTimer extends StatefulWidget {
  final int seconds;

  const RequestTimeoutTimer({super.key, required this.seconds});

  @override
  State<RequestTimeoutTimer> createState() => _RequestTimeoutTimerState();
}

class _RequestTimeoutTimerState extends State<RequestTimeoutTimer> {
  late int _secondsRemaining;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.seconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() =>
          _secondsRemaining < 1 ? _timer.cancel() : _secondsRemaining -= 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    String minutes = (_secondsRemaining ~/ 60).toString().padLeft(2, '0');
    String seconds = (_secondsRemaining % 60).toString().padLeft(2, '0');
    return Text.rich(
      TextSpan(
        text: seconds == "00" ? "Resend" : "Resend code in",
        children: [
          TextSpan(
              text: seconds == "00" ? "" : ' $minutes:$seconds',
              style: TextStyle(color: context.colorScheme.primary)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
