import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as api;

import 'model/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  String responseFromServer = "";
  List postsData = [];
  List<Post> postsList = [];

  // int a = 10;

  // late int b;

  // TabController tabController = TabController(length: 1, vsync: this);

  @override
  void initState() {
    super.initState();
    print("1. init state called");

    fetchDataFromSerer();
  }

  postDataToTheServer() async {
    print("starting post reqeust");
    final url = "https://jsonplaceholder.typicode.com/posts";

    final respose = await api.post(Uri.parse(url), body: {});
    print("post request success");

    print(respose.body);
  }

  fetchDataFromSerer() async {
    print("fetch data from server");

    final url = "https://jsonpldddddaceholder.typicode.com/posts";

    final uri = Uri.parse(url);

    final response = await api.get(uri, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer eywognoenawegawegaweegaweg"
    });

    print(response.body);

    responseFromServer = response.body;

    setState(() {});

    List decodedReponse = json.decode(response.body); // List<Map>

    postsData = decodedReponse;

    print(decodedReponse);

    final tempList = decodedReponse.map<Post>((item) {
      final _post = Post.convertFromJson(item);

      return _post;
    }).toList();

    postsList = tempList;

    // Post.fromList(decodedReponse);

    // tempList;

    // body = actual data sent from server
    // statusCode:
    // ~200(200, 201, 204) = success
    //
    //, ~300(307) = redirect
    // ~400(400, 401, 403, 404, 422) = user induced errors
    // ~500(500, 503) = server side error
  }

  /// GET
  /// POST
  /// PUT
  /// PATCH
  /// DELETE
  /// HEAD

  @override
  Widget build(BuildContext context) {
    print("build called");

    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          MaterialButton(
            child: Text("Post request"),
            onPressed: () {
              postDataToTheServer();
            },
          ),
          // Text(responseFromServer),

          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                itemCount: postsList.length,
                itemBuilder: (context, index) {
                  Map currentPost = postsData[index];
                  final post = postsList[index];

                  // Map postMap = post.convertFromPostToMap();

                  // Post postDdata = Post.convertFromJson(postMap);

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.21),
                              offset: Offset(3, 5),
                              blurRadius: 5,
                              spreadRadius: 5),
                        ],
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          post.body,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
