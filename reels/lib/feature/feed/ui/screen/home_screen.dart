import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as httpClient;
import 'package:reels/common/utils/constants.dart';
import 'package:reels/feature/feed/model/video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> videosList = [];

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
      });

      print(hits);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videosList.length,
            itemBuilder: (context, index) {
              Video currentVideo = videosList[index];

              return Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Image.network(
                      currentVideo.userImageUrl,
                    ),
                    Center(
                      child: Text(
                        currentVideo.userImageUrl,
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
