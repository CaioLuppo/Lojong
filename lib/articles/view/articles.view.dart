import 'package:flutter/material.dart';
import 'package:lojong/articles/components/article_element.dart';
import 'package:lojong/articles/view_model/articles.viewmodel.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/components/session_error_message.dart';
import 'package:lojong/src/strings.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ArticlesViewModel().getAllListElements(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                padding: const EdgeInsets.all(24),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final article = snapshot.data![index];
                  return ArticleElement(article);
                },
              );
            } else {
              return const SessionErrorMessage(
                message: LojongStrings.noArticles,
                showReolad: false,
              );
            }
          } else {
            return const SessionErrorMessage(
              message: LojongStrings.networkError,
            );
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}
