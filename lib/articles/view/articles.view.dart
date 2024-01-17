import 'package:flutter/material.dart';
import 'package:lojong/articles/components/article_element.dart';
import 'package:lojong/articles/view_model/articles.viewmodel.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/components/session_error_message.dart';
import 'package:lojong/src/colors.dart';
import 'package:lojong/src/strings.dart';
import 'package:provider/provider.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final ScrollController scrollController = ScrollController();
  static int page = 1;
  bool addedListener = false;

  @override
  Widget build(BuildContext context) {
    final articlesViewModel = Provider.of<ArticlesViewModel>(context);
    if (!ArticlesViewModel.didRequest && !articlesViewModel.error) {
      articlesViewModel.loadArticlesFromPage(context, 1);
      if (!articlesViewModel.error) {
        page++;
      }
    }
    addListenerToList(context);

    if (ArticlesViewModel.didRequest) {
      if (articlesViewModel.articles.isEmpty) {
        return const SessionErrorMessage(message: LojongStrings.noArticles);
      }
      return ListView.separated(
        padding: const EdgeInsets.all(24),
        controller: scrollController,
        itemCount: articlesViewModel.articles.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          if (index == articlesViewModel.articles.length &&
              page < articlesViewModel.pages) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(
                  color: LojongColors.background,
                ),
              ),
            );
          } else if (index == articlesViewModel.articles.length) {
            return const SizedBox();
          }
          return ArticleElement(articlesViewModel.articles[index]);
        },
      );
    } else if (articlesViewModel.error) {
      return SessionErrorMessage(
        message: LojongStrings.networkError,
        reloadFunction: () {
          articlesViewModel.setError(false);
          setState(() {});
        },
      );
    }
    return const Loading();
  }

  void addListenerToList(BuildContext context) {
    if (!addedListener) {
      scrollController.addListener(() {
        final position = scrollController.position;
        final provider = Provider.of<ArticlesViewModel>(context, listen: false);
        if (position.pixels == position.maxScrollExtent &&
            page > 1 &&
            page <= provider.pages) {
          provider.loadArticlesFromPage(context, page);
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
