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
  // FeedCubit feedCubit = FeedCubit();

  final videoUrl =
      "https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4";

  @override
  void initState() {
    super.initState();

    print("init state called");

    final feedCubit = BlocProvider.of<FeedCubit>(context);

    feedCubit.fetchVideos();

    ///
  }

  Widget buildBodyWithCubit() {
    //  BlocConsumer is the combined form of BlocBuilder and BlocListener

    return BlocConsumer<FeedCubit, FeedState>(
      listener: (context, state) async {
        if (state is FeedFetchedSuccessState) {
          //
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Text("Yay , success data fetched",
                      style: TextStyle(color: Colors.green, fontSize: 30)),
                );
              });

          await Future.delayed(Duration(seconds: 4), () {
            Navigator.pop(context);
          });
        }
      },
      // catches or listens the bloc's states and builds the ui

      builder: (context, state) {
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

        if (state is FeedFetchedSuccessState || state is FeedLoadingMoreData) {
          // 0,1,2,3
          return new TikTokPageView(videoList: state.data);
        }

        // if (state is FeedLoadingMoreData) {
        //   /// 10 data items
        //   /// 0
        //   /// ,1,2,3
        //   return Column(
        //     children: [
        //       Expanded(
        //         child: new TikTokPageView(
        //             videoList: state.data, feedCubit: feedCubit),
        //       ),
        //       CircularProgressIndicator()
        //     ],
        //   );
        // }

        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(body: buildBodyWithCubit());
  }
}
