import 'dart:async';

StreamController<int> dataStreamController = StreamController();

int currentdata = 0;

Future<int> thisIsDelayed() async {
  await Future.delayed(
    Duration(seconds: 2),
    () {
      print("4.I am delayed by 2 seconds");
    },
  );

  print("2.This is obviously delayed");
  return 1;
}

addDataInStream() {
  Timer.periodic(Duration(seconds: 2), (timer) {
    currentdata += 2; // currentData= currentData+2;
    dataStreamController.add(currentdata);
  });
}

main() async {
  print("1. this is called second time");

  var delayedVaule = await thisIsDelayed(); // 5

  var secondValue = await thisIsDelayed(); // 5

  var thirdValue = await thisIsDelayed(); //5

  var list = Future.wait([thisIsDelayed(), thisIsDelayed(), thisIsDelayed()]);

  // delayedVaule.then((value) {
  //   ///
  // });

  // delayedVaule.catchError((e) {});

  print("3.This might might be called at last");

  addDataInStream();

  dataStreamController.stream.listen(
    (value) {
      print(value);
    },
  );
}
