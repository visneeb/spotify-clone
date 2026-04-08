class Track {
  final String title;
  final String artist;
  final String album;
  final String imageUrl;
  final String duration;
  final int durationSeconds;
  final bool isLiked;

  const Track({
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
    required this.duration,
    required this.durationSeconds,
    this.isLiked = false,
  });
}
