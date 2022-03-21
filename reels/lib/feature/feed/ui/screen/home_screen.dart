import 'dart:convert';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as httpClient;
import 'package:reels/common/utils/constants.dart';
import 'package:reels/feature/feed/model/video.dart';
import 'package:reels/feature/feed/ui/widgets/video_player.dart';

import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videosList = [];

  bool isLoading = false;

  String errorMessage = "";

  bool hasErrorOccurred = false;

  final videoUrl =
      "https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4";

  @override
  void initState() {
    super.initState();

    print("init state called");
    fetchVideos();

    ///
  }

  fetchVideos() async {
    final url =
        "https://pixabay.com/api/videos?key=${Constants.pixabayApiKey}&q=car";

    final uri = Uri.parse(url);
    try {
      print("Fetching the video data");
      isLoading = true;
      setState(() {});

      final response = await httpClient.get(uri);

      final Map<String, dynamic> decodedBody = json.decode(response.body);

      final totalItems = decodedBody['totalHits'];

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

      setState(() {
        videosList = tempVideosList;
        isLoading = false;
      });
    } catch (e, s) {
      print(e);
      print(s);

      isLoading = false;

      hasErrorOccurred = true;
      errorMessage = e.toString();

      showErrorMessage(e.toString());
      setState(() {});
    }
  }

  showErrorMessage(String message) {
    Fluttertoast.showToast(
        msg: message, gravity: ToastGravity.BOTTOM, textColor: Colors.red);
  }

  @override
  void dispose() {
    super.dispose();
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

  buildVPlayer() {
    return VideoPlayer(
      VideoPlayerController.network(videoUrl,
          videoPlayerOptions: VideoPlayerOptions()),
    ).controller
      ..addListener(() {
        setState(() {});
      });
  }

  Widget buildBody() {
    final theme = Theme.of(context);

    final txt = Theme.of(context).textTheme;

    if (isLoading) {
      // true
      return Center(child: CircularProgressIndicator());
    }

    if (hasErrorOccurred) {
      // true
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 40,
            ),
            Text("An error has occurred"),
          ],
        ),
      );
    }

    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videosList.length,
      itemBuilder: (context, index) {
        Video currentVideo = videosList[index];

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
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(body: buildBody());
  }
}
