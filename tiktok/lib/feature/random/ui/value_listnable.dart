import 'package:flutter/material.dart';

class ValueListenableWidget extends StatelessWidget {
  ValueNotifier<int> number = ValueNotifier(0);

//

  @override
  Widget build(BuildContext context) {
    print("build function called");
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// value listenale builder
          SizedBox(height: 20),
          ValueListenableBuilder<int>(
            valueListenable: number,
            child: Text(
              "The count value with value listenbale builder is :",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            builder: (context, value, nonChaningUIChild) {
              print("Value listenable rebuild");
              return Column(
                children: [
                  if (nonChaningUIChild != null) nonChaningUIChild,
                  Text(
                    value.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )
                ],
              );
            },
          ),
          // ValueListenableBuilder<int>(
          //     valueListenable: number,
          //     child: Container(),
          //     builder: (context, numberValue, child) {
          //       return Container(
          //         child: child,
          //       );
          //     })
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        var temp = number.value + 1;
        number.value = temp;
      }),
    );
  }
}
