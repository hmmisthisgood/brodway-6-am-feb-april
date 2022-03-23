import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tiktok/feature/feed/cubit/feed_cubit.dart';
import 'package:tiktok/feature/feed/cubit/feed_state.dart';
import 'package:tiktok/feature/feed/model/video.dart';
import 'package:tiktok/feature/feed/ui/widgets/video_player.dart';

import '../widgets/tik_tok_pageview.dart';

class HomeScreenWithCubit extends StatefulWidget {
  const HomeScreenWithCubit({Key? key}) : super(key: key);

  @override
  State<HomeScreenWithCubit> createState() => _HomeScreenWithCubitState();
}

class _HomeScreenWithCubitState extends State<HomeScreenWithCubit> {
  FeedCubit feedCubit = FeedCubit();

  final videoUrl =
      "https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4";

  @override
  void initState() {
    super.initState();

    print("init state called");

    feedCubit.fetchVideos();

    ///
  }

  Widget buildBodyWithCubit() {
    return BlocBuilder(
      bloc: feedCubit,
      builder: (context, FeedState state) {
        print(state);

        if (state is FeedLoadingState || state is FeedInitialState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is FeedErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red, size: 40),
                Text(state.errorMessage),
              ],
            ),
          );
        }
        if (state is FeedFetchedSuccessState) {
          return TikTokPageView(videoList: state.data, feedCubit: feedCubit);
        }
        if (state is FeedLoadingMoreData) {
          return Column(
            children: [
              Expanded(
                child:
                    TikTokPageView(videoList: state.data, feedCubit: feedCubit),
              ),
              CircularProgressIndicator()
            ],
          );
        }

        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(body: buildBodyWithCubit());
  }
}
