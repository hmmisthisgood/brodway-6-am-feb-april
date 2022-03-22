import 'package:reels/feature/feed/model/video.dart';

abstract class FeedState {}

///

class FeedInitialState extends FeedState {}

class FeedLoadingState extends FeedState {}

class FeedErrorState extends FeedState {
  final String errorMessage;

  FeedErrorState({required this.errorMessage});
}

class FeedFetchedSuccessState extends FeedState {
  final List<Video> data;
  FeedFetchedSuccessState({required this.data});
}

class FeedLoadingMoreData extends FeedState {
  final List<Video> data;
  FeedLoadingMoreData({required this.data});
}
