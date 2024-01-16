class Video {
  final String name;
  final String description;
  final String imageUrl;
  final String videoUrl;
  final int orderId;

  Video({
    required this.orderId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.videoUrl,
  });

  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      orderId: map["order"],
      name: map["name"],
      description: map["description"],
      videoUrl: map["aws_url"],
      imageUrl: map["image_url"]
    );
  }
}
