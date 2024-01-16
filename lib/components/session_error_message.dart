import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class SessionErrorMessage extends StatelessWidget {
  final String message;
  final void Function()? reloadFunction;

  const SessionErrorMessage({
    super.key,
    required this.message,
    this.reloadFunction,
  });

  @override
  Widget build(BuildContext context) {
    final showButton = reloadFunction != null;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "OPS!",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: showButton ? 16 : 0),
          showButton
              ? ElevatedButton(
                  onPressed: reloadFunction,
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      LojongColors.buttonBackGround,
                    ),
                  ),
                  child: Text(
                    "Recarregar",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
