import 'package:firstapp/post_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/post_widget.dart';

class PostsListView extends StatelessWidget {
  PostsListView({Key? key}) : super(key: key);

  final postsList = ["post 1", "post 2", "post 3"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: postsList.length, //10 // for loop // list.forEach,list.map
      // separatorBuilder: (context, index) {
      //   return Container(
      //     height: 50,
      //     color: Colors.red,
      //   );
      // },

      itemBuilder: (context, index) {
        // print(index); // 0,1,----9
        // 10
        final _postTitle = postsList[index];
        print(_postTitle);

        return Column(
          children: [
            PostWidget(_postTitle),
          ],
        );
      },
    )

        // ListView(
        //   physics: BouncingScrollPhysics(),
        //   children: [
        //     PostWidget(),
        //  PostWidget(),   PostWidget(),   PostWidget(),   PostWidget(),   PostWidget(),
        //     Text("This is an instagram post"),
        //     Container(
        //       height: 200,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       height: 200,
        //       color: Colors.pink,
        //     )
        //   ],
        // ),

        );
  }
}

/// Listviews in flutter
/// 1. SingleChildScrollView  = has only one child
/// 2. ListView, ListView.builder, ListView.separated, ListView.count
/// 3. GridView, GridView.builder

/// Advanced
/// 4. CustomScrollView , NestedScrollView
