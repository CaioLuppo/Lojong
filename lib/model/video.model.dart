class Video {
  String? name;
  String? description;
  String? imageUrl;
  String? videoUrl;
  int? orderId;

  Video({
    required this.orderId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
  });

  Video.fromMap(Map<String, dynamic> map) {
    orderId = map["order"];
    name = map["name"];
    description = map["description"];
    videoUrl = map["aws_url"];
    imageUrl = map["image_url"];
  }
}
