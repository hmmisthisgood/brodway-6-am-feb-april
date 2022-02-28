import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  PostWidget(
    this.postTitle, {
    Key? key,
  }) : super(key: key);

  String postTitle; // cannot be null

  Widget buildFirst(double screenWidth) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/wall.jpg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  postTitle,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Icon(Icons.more_horiz)
          ],
        ),
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    return Image.asset("assets/images/wall.jpg");
  }

  Widget buildThirdSectionIcons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.favorite_border),
              SizedBox(width: 8),
              Icon(Icons.comment),
              SizedBox(width: 8),
              Icon(Icons.send_rounded)
            ],
          ),
          Icon(Icons.bookmark_border)
        ],
      ),
    );
  }

  Widget buildFourthSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        children: [
          Text("Liked by "),
          Text(
            "some_guy ",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text("and "),
          Text(
            "others",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextWithRichte() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(text: "Liked by "),
        TextSpan(
          text: "some_guy ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: "and "),
        TextSpan(text: "others", style: TextStyle(fontWeight: FontWeight.bold)),
      ], style: TextStyle(color: Colors.black))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFirst(screenWidth),
        buildImage(context),
        buildThirdSectionIcons(),
        buildFourthSection(),
        buildTextWithRichte(),
      ],
    );
  }
}
