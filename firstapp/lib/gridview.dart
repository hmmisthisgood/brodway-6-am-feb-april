import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewScreen extends StatelessWidget {
  // 0,1,2,3 ----n
  List<String> postTitles = [
    "This is a good post", //0
    "This ", //1
    "This is ", //2
    "This is a good ",
    "This is a good post",
    "good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
    "This is a good post",
  ];

  buildChild(
      {required Color color, required int index, required String postTitle}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: color,
            height: 200,
            width: 100,
            child: Center(
              child: Text(
                index.toString(),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          Text(
            postTitle,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }

  Widget buildGridView() {
    return GridView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.4,
        // 0.5=  width= height/2 (in Axis.vertical)
        // 0.5= in Axis.horizontal= height= width/2
      ),
      children: [
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        // buildChild(color: Colors.black),
        Container(color: Colors.green, child: Icon(Icons.home, size: 50)),
        Icon(Icons.ac_unit),
        Row(children: [Text("This is a text")])
      ],
    );
  }

  Widget buildGridViewWithBuilder() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.38,
      ),
      itemCount: postTitles.length,
      itemBuilder: (context, index) {
        print(index);
        // 0,1,2----n
        // 14
        final currentPost = postTitles[index];

        return buildChild(
            color: index % 2 == 0 ? Colors.green : Colors.black,
            index: index,
            postTitle: currentPost);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: buildGridViewWithBuilder());
  }
}
