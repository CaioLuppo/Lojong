import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/insight/components/share_button_big.dart';
import 'package:lojong/insight/viewmodel/insight.viewmodel.dart';
import 'package:lojong/model/article.model.dart';
import 'package:lojong/model/article_element.model.dart';
import 'package:lojong/model/video.model.dart';
import 'package:lojong/page_navigator/components/lojong_appbar.dart';
import 'package:lojong/src/colors.dart';
import 'package:provider/provider.dart';

import '../components/author_card.dart';
import '../components/insight_media.dart';

class InsightView extends StatelessWidget {
  final dynamic content;

  const InsightView({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LojongColors.background,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Hero(
              tag: "appbar",
              child: LojongAppBar(
                hideTitle: true,
                onReturn: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Hero(
                tag: "container",
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(24),
                    child: FutureBuilder(
                      future: loadMedia(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          final data = snapshot.data;
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  InsightMedia(data: data),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24),
                                    child: Text(
                                      data is Video ? data.name : data.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  data is Video
                                      ? Text(
                                          data.description ?? "",
                                          textAlign: TextAlign.justify,
                                        )
                                      : Html(
                                          data: data.fullText,
                                          style: {
                                            'html': Style(
                                              textAlign: TextAlign.justify,
                                            )
                                          },
                                        ),
                                  data is Article
                                      ? AuthorCard(data: data)
                                      : const SizedBox(),
                                  const SizedBox(height: 16),
                                  const BigShareButton(),
                                ],
                              ),
                            ),
                          );
                        }
                        return const Loading();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> loadMedia(BuildContext context) async {
    if (content is Video) {
      return content as Video;
    } else {
      content as ArticleElementModel;
      final provider = Provider.of<InsightViewModel>(context);
      return await provider.getArticle(content.id);
    }
  }
}
