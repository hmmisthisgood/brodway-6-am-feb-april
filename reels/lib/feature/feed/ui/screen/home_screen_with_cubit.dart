import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:reels/feature/feed/cubit/feed_cubit.dart';
import 'package:reels/feature/feed/cubit/feed_state.dart';
import 'package:reels/feature/feed/model/video.dart';
import 'package:reels/feature/feed/ui/widgets/video_player.dart';

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

  Widget buildFollowButtons() {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Follow",
        ),
        SizedBox(width: 10),
        Text(
          "|",
        ),
        SizedBox(width: 10),
        Text(
          "Following",
        ),
      ]),
    );
  }

  Widget buildUsernameAndCaptions() {
    final theme = Theme.of(context);

    final txt = Theme.of(context).textTheme;

    return Container(
      height: 100,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("@arunji",
                // style: txt.headline4?.copyWith(fontWeight: FontWeight.bold),
                style: txt.headline5),
            SizedBox(height: 5),
            Text(
              "Tyko night",
              style: txt.headline6,
            ),
            SizedBox(height: 5),
            Text(
              "This is a very  long caption of the video I am posting This is a very  long caption of the video I am posting",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: txt.headline6,
            )
          ],
        ),
      ),
    );
  }

  Widget buildVerticalControlBUttons() {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: 80,
      color: Colors.pink,
    );
  }

  Widget buildBodyWithCubit() {
    return BlocBuilder(
      bloc: feedCubit,
      builder: (context, FeedState state) {
        print(state);

        if (state is FeedLoadingState || state is FeedInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
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
        if (state is FeedFetchedSuccessState)
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.data.length,
            onPageChanged: (index) {
              //
              if (index == 2) {
                /// Fetch the data from new pages
                ///
                feedCubit.loadMoreVideos();
              }
            },
            itemBuilder: (context, index) {
              Video currentVideo = state.data[index];

              return Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    CustomVideoPlayer(
                      // videoUrl: videoUrl,
                      videoUrl: currentVideo.availableResolutions.medium.url,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: buildVerticalControlBUttons(),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: buildFollowButtons(),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 10,
                      child: buildUsernameAndCaptions(),
                    )
                  ],
                ),
              );
            },
          );

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
