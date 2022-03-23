import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/feature/feed/cubit/feed_state.dart';
import 'package:http/http.dart' as httpClient;

import '../../../common/utils/constants.dart';
import '../model/video.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit() : super(FeedInitialState());

  int currentPage = 1;

  List<Video> allVideos = [];

  fetchVideos() async {
    final url =
        "https://pixabay.com/api/videos?key=${Constants.pixabayApiKey}&q=car&per_page=5&page=$currentPage";

    final uri = Uri.parse(url);

    try {
      print("Fetching the video data");

      emit(FeedLoadingState());

      final response = await httpClient.get(uri);

      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final List hits = decodedBody["hits"];

      // final first = hits[0];
      // final second = hits[1];

      // final firstVideo = Video.fromJson(first);

      List<Video> tempVideosList = hits.map((item) {
        final Video convertedVideo = Video.fromJson(item);

        return convertedVideo;
      }).toList();

      /// same as above , => means return
      tempVideosList = hits.map((item) => Video.fromJson(item)).toList();

      print("video fetcch complete");

      allVideos = tempVideosList;

      emit(FeedFetchedSuccessState(data: allVideos));
    } catch (e, s) {
      print(e);
      print(s);
      emit(FeedErrorState(errorMessage: e.toString()));
    }
  }

  loadMoreVideos() async {
    currentPage++;

    final url =
        "https://pixabay.com/api/videos?key=${Constants.pixabayApiKey}&q=car&per_page=5&page=$currentPage";

    final uri = Uri.parse(url);

    try {
      print("loading more data");

      emit(FeedLoadingMoreData(data: allVideos));

      final response = await httpClient.get(uri);

      final Map<String, dynamic> decodedBody = json.decode(response.body);
      final List hits = decodedBody["hits"];

      List<Video> tempVideosList =
          hits.map((item) => Video.fromJson(item)).toList();

      allVideos.addAll(tempVideosList);

      emit(FeedFetchedSuccessState(data: allVideos));
    } catch (e, s) {
      print(e);
      print(s);
      emit(FeedErrorState(
          errorMessage: "An error occureed while loading more data"));
    }
  }
}
