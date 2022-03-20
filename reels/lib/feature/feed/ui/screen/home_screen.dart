import 'dart:convert';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as httpClient;
import 'package:reels/common/utils/constants.dart';
import 'package:reels/feature/feed/model/video.dart';

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

  @override
  void initState() {
    super.initState();
    fetchVideos();

    ///
  }

  fetchVideos() async {
    final url =
        "https://pixabay.com/api/videos?key=${Constants.pixabayApiKey}&q=car";

    final uri = Uri.parse(url);
    try {
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

      setState(() {
        videosList = tempVideosList;
        isLoading = false;
      });

      print(hits);
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

  buildFollowButtons() {
    return Container(
      width: 300,
      height: 30,
      color: Colors.red,
    );
  }

  buildUsernameAndCaptions() {
    return Container(
      height: 100,
      width: 200,
      color: Colors.yellow,
    );
  }

  buildVerticalControlBUttons() {
    return Container(
      height: 200,
      width: 40,
      color: Colors.pink,
    );
  }

  buildVideoPlayer(String videoUrl) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer.network(
        videoUrl,
        betterPlayerConfiguration: BetterPlayerConfiguration(
          autoPlay: true,

          // fullScreenByDefault: true,
          controlsConfiguration:
              BetterPlayerControlsConfiguration(showControls: false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : hasErrorOccurred == true
              ? Text(errorMessage)
              : PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: videosList.length,
                  itemBuilder: (context, index) {
                    Video currentVideo = videosList[index];

                    /// Stack [video, follow/following, username and captions, icons vertical bar]
                    ///

                    return Stack(
                      children: [
                        Container(
                          // color: Colors.green,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        buildVideoPlayer(
                            currentVideo.availableResolutions.medium.url),
                        buildFollowButtons(),
                        buildVerticalControlBUttons()
                      ],
                    );
                  },
                ),
    );
  }
}
