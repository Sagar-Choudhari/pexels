class Post {
  final String id;
  final String imageUrl;
  final String title;
  final bool isLiked;

  Post(
      {required this.id,
      required this.imageUrl,
      required this.title,
      this.isLiked = false});
}
