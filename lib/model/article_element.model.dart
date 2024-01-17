class ArticleElementModel {
  String? text;
  String? title;
  String? imageUrl;
  int? id;

  ArticleElementModel({
    this.id,
    this.text,
    this.title,
    this.imageUrl,
  });

  ArticleElementModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    text = map["text"];
    title = map["title"];
    imageUrl = map["image_url"];
  }
}
