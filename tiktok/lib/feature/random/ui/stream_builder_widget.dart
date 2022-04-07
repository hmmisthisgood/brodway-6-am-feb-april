import 'dart:async';

import 'package:flutter/material.dart';

class StreamUi extends StatefulWidget {
  const StreamUi({Key? key}) : super(key: key);

  @override
  State<StreamUi> createState() => _StreamUiState();
}

class _StreamUiState extends State<StreamUi> {
  StreamController<int> timeController = StreamController.broadcast();
  int currentValue = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    addValuesInStream();
  }

  addValuesInStream() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentValue++;

      timeController.add(currentValue);
    });
  }

  @override
  void dispose() {
    super.dispose();

    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
              stream: timeController.stream,
              builder: (context, AsyncSnapshot<int> snapshot) {
                var connState = snapshot.connectionState;

                print(connState);

                if (connState == ConnectionState.done) {}

                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Text(connState.toString());
              }),
        ],
      ),
    );
  }
}


// Future builder 
// Listview builder 
// Stream Builder 
// Value Listenable Builder = rebuilds when a value is changed