import 'package:flutter/material.dart';

class SessionErrorMessage extends StatelessWidget {
  final String message;

  const SessionErrorMessage({
    super.key,
    required this.message,
    bool showReolad = true,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [],
    );
  }
}
