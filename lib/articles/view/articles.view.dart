import 'package:flutter/material.dart';
import 'package:lojong/articles/components/article_element.dart';
import 'package:lojong/articles/view_model/articles.viewmodel.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/components/session_error_message.dart';
import 'package:lojong/src/strings.dart';
import 'package:provider/provider.dart';

import '../../components/session_page_slider.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    final articlesViewModel = Provider.of<ArticlesViewModel>(context);
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: FutureBuilder(
                future: ArticlesViewModel().getAllListElements(
                  context,
                  articlesViewModel.currentPage,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isNotEmpty) {
                        return ListView.separated(
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 40,
                          ),
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
                        );
                      }
                    } else {
                      return SessionErrorMessage(
                        message: LojongStrings.networkError,
                        reloadFunction: () => setState(() {}),
                      );
                    }
                  } else {
                    return const Loading();
                  }
                },
              ),
            ),
          ),
          SessionPageSlider(
            canDecrease: articlesViewModel.currentPage > 1,
            canIncrease:
                articlesViewModel.currentPage < articlesViewModel.pages,
            onDecrease: () => articlesViewModel.previousPage(),
            onIncrease: () => articlesViewModel.nextPage(),
            currentPage: articlesViewModel.currentPage,
          ),
        ],
      ),
    );
  }
}
