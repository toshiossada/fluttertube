import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/models/video.dart';

class FavoriteBloc implements BlocBase {
  Map<String, Video> _favorites = {};
  
  final  _favController = StreamController<Map<String, Video>>.broadcast();
  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video){
    if(_favorites.containsKey(video.id)) _favorites.remove(video.id);
    else _favorites[video.id] = video;

    _favController.sink.add(_favorites);

  }

  @override
  void dispose() {
    _favController.close();
  }

  @override
  void addListener(listener) {
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => _favController.hasListener;

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(listener) {
    // TODO: implement removeListener
  }
}
