import 'package:tiktok/feature/feed/model/video.dart';

abstract class FeedState {
  final data;
  FeedState({this.data});
}

///

class FeedInitialState extends FeedState {
  FeedInitialState();
}

class FeedLoadingState extends FeedState {
  FeedLoadingState();
}

class FeedErrorState extends FeedState {
  final String errorMessage;

  FeedErrorState({required this.errorMessage});
}

class FeedFetchedSuccessState extends FeedState {
  final List<Video> data;
  FeedFetchedSuccessState({required this.data}) : super(data: data);
}

class FeedLoadingMoreData extends FeedState {
  final List<Video> data;
  FeedLoadingMoreData({required this.data}) : super(data: data);
}
