import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojong/components/share_button.dart';
import 'package:lojong/model/quote.model.dart';
import 'package:lojong/src/assets.dart';
import 'package:lojong/src/colors.dart';

class QuoteElement extends StatelessWidget {
  final Quote quote;
  static int quotes = 0;

  const QuoteElement(this.quote, {super.key});

  @override
  Widget build(BuildContext context) {
    quotes++;
    final even = quotes % 2 == 0;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SvgPicture.asset(
              even ? LojongQuotesBg.yellow : LojongQuotesBg.blue,
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  quote.text ?? "",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: even
                            ? LojongColors.quoteOddText
                            : LojongColors.blueText,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  quote.author ?? "",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: even
                            ? LojongColors.quoteOddText
                            : LojongColors.blueText,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                ShareButton(
                  bgColor: even
                      ? LojongColors.quoteOddButtonBackGround
                      : LojongColors.blueText,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
