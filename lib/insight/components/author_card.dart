import 'package:flutter/material.dart';
import 'package:lojong/model/article.model.dart';
import 'package:lojong/src/colors.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.data,
  });

  final Article data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: LojongColors.cardBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: LojongColors.text,
                shape: BoxShape.circle,
              ),
              width: 48,
              height: 48,
              child: Image.network(
                data.authorImage ?? "",
                errorBuilder: (_, __, ___) {
                  return Center(
                    child: Text(
                      data.authorName != null ? data.authorName![0] : "",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.authorName ?? "",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.authorDescription ?? "",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
