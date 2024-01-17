class Article {
  int? id;
  String? text;
  String? title;
  String? imageUrl;
  String? authorName;
  String? url;
  int? premium;
  int? order;
  String? fullText;
  String? authorImage;
  String? authorDescription;
  String? image;

  Article({
    this.id,
    this.text,
    this.title,
    this.imageUrl,
    this.authorName,
    this.url,
    this.premium,
    this.order,
    this.fullText,
    this.authorImage,
    this.authorDescription,
    this.image,
  });

  Article.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    text = map['text'];
    title = map['title'];
    imageUrl = map['image_url'];
    authorName = map['author_name'];
    url = map['url'];
    premium = map['premium'];
    order = map['order'];
    fullText = map['full_text'];
    authorImage = map['author_image'];
    authorDescription = map['author_description'];
    image = map['image'];
  }
}
