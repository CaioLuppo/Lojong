class ArticleElementModel {
  final String text;
  final String title;
  final String imageUrl;
  final int id;

  ArticleElementModel({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
  });

  factory ArticleElementModel.fromMap(Map<String, dynamic> map) {
    return ArticleElementModel(
      id: map["id"],
      text: map["text"],
      title: map["title"],
      imageUrl: map["image_url"]
    );
  }
}
