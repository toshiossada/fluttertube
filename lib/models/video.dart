class Video {
  final String id;
  final String title;
  final String thumb;
  final String chanel;

  Video({this.id, this.title, this.thumb, this.chanel});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      thumb: json['snippet']['thumbnails']['high']['url'],
      chanel: json['snippet']['chanelTitle'],
    );
  }
}
