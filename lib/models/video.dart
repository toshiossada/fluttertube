class Video {
  final String id;
  final String title;
  final String thumb;
  final String chanel;

  Video({this.id, this.title, this.thumb, this.chanel});

  factory Video.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('id'))
      return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        thumb: json['snippet']['thumbnails']['high']['url'],
        chanel: json['snippet']['chanelTitle'],
      );
    else
      return Video(
        id: json['videoId'],
        title: json['title'],
        thumb: json['thumb'],
        chanel: json['chanel'],
      );
  }

  Map<String, dynamic> toJson() =>
      {'videoId': id, 'title': title, 'thumb': thumb, 'chanel': chanel};
}
