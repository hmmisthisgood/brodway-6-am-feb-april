import 'package:flutter/material.dart';
import 'package:tiktok/feature/feed/cubit/feed_cubit.dart';

import '../../model/video.dart';

class TikTokPageView extends StatelessWidget {
  const TikTokPageView(
      {Key? key, required this.videoList, required this.feedCubit})
      : super(key: key);
  final List<Video> videoList;

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

  Widget buildUsernameAndCaptions(ThemeData theme) {
    final txt = theme.textTheme;

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

  Widget buildVerticalControlBUttons(double height) {
    return Container(
      height: height / 2,
      width: 80,
      color: Colors.pink,
    );
  }

  final FeedCubit feedCubit;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 2;
    final theme = Theme.of(context);

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videoList.length,
      onPageChanged: (index) {
        //
        // 20 ,   index= 16
        int differnce = videoList.length - index;

        if (differnce < 3) {
          /// Fetch the data from new pages
          ///
          feedCubit.loadMoreVideos();
        }
      },
      itemBuilder: (context, index) {
        Video currentVideo = videoList[index];

        return Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              // CustomVideoPlayer(
              //   // videoUrl: videoUrl,
              //   videoUrl: currentVideo.availableResolutions.medium.url,
              // ),

              Image.network(currentVideo.userImageUrl),

              Align(
                  alignment: Alignment.center,
                  child: Text(
                    currentVideo.user,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
              Positioned(
                right: 0,
                bottom: 0,
                child: buildVerticalControlBUttons(height),
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
                child: buildUsernameAndCaptions(theme),
              )
            ],
          ),
        );
      },
    );
  }
}
