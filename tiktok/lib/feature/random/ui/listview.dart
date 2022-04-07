import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Donnt use shrink wrap in list view.
    /// shrinkWrap is very expensive in terms of performance

    return Scaffold(
      body: ListView(

          /// NOTE: dont use it
          // shrinkWrap: true,

          children: [
            Column(
              children: List.generate(
                  10,
                  (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black,
                        height: 100,
                      ))),
            ),
          ]),
    );
  }
}
