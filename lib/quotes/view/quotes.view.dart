import 'package:flutter/material.dart';
import 'package:lojong/quotes/components/quote_element.dart';
import 'package:lojong/quotes/view_model/quotes.viewmodel.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/components/session_error_message.dart';
import 'package:lojong/src/colors.dart';
import 'package:lojong/src/strings.dart';
import 'package:provider/provider.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final ScrollController scrollController = ScrollController();
  static int page = 1;
  bool addedListener = false;

  @override
  Widget build(BuildContext context) {
    final quotesViewModel = Provider.of<QuotesViewModel>(context);
    if (!QuotesViewModel.didRequest) {
      quotesViewModel.loadQuotesFromPage(context, 1);
      page++;
    }
    addListenerToList(context);

    if (QuotesViewModel.didRequest || quotesViewModel.error) {
      if (quotesViewModel.quotes.isEmpty) {
        return const SessionErrorMessage(message: LojongStrings.noArticles);
      }
      return ListView.separated(
        padding: const EdgeInsets.all(16),
        controller: scrollController,
        itemCount: quotesViewModel.quotes.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          if (index == quotesViewModel.quotes.length &&
              page < quotesViewModel.pages) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(
                  color: LojongColors.background,
                ),
              ),
            );
          } else if (index == quotesViewModel.quotes.length) {
            return const SizedBox();
          }
          return QuoteElement(quotesViewModel.quotes[index]);
        },
      );
    }
    return const Loading();
  }

  void addListenerToList(BuildContext context) {
    if (!addedListener) {
      scrollController.addListener(() {
        final position = scrollController.position;
        final provider = Provider.of<QuotesViewModel>(context, listen: false);
        if (position.pixels == position.maxScrollExtent &&
            page > 1 &&
            page <= provider.pages) {
          provider.loadQuotesFromPage(context, page);
          page++;
        }
      });
      if (!addedListener) {
        setState(() {
          addedListener = true;
        });
      }
    }
  }
}
