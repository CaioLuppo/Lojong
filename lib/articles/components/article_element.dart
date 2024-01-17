import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lojong/components/share_button.dart';
import 'package:lojong/components/thumb_place_holder.dart';
import 'package:lojong/insight/view/insight.view.dart';
import 'package:lojong/model/article_element.model.dart';

class ArticleElement extends StatelessWidget {
  final ArticleElementModel article;

  const ArticleElement(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => InsightView(content: article),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      ),
      child: Column(
        children: [
          Text(
            "ARTIGO ${article.title?.toUpperCase()}",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: article.imageUrl ?? "",
              height: 192,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(milliseconds: 300),
              placeholder: (_, __) => const ThumbPlaceHolder(),
              errorWidget: (_, __, ___) =>
                  const ThumbPlaceHolder(error: true),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            article.text ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const ShareButton()
        ],
      ),
    );
  }
}
