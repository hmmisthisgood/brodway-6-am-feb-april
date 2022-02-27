import 'dart:async';

import 'try_catch.dart';

Future<int> returnDelaySeconds() async {
  print("2. this is not actually delayed");

  await Future.delayed(Duration(seconds: 2), () {
    print("3. this is delayed");
  });

  return 2;
  // throw "this is error";
}

Future<int> printDelayWithCustomDuration(int delayInSeconds) async {
  print("4. printDelayWithCustomDuration $delayInSeconds");

  await Future.delayed(Duration(seconds: delayInSeconds), () {
    print("5.this is delayed by  $delayInSeconds seconds");
  });
  return 100;
  // throw "this is error";
}

customAsyncFunction() {
  Completer newCompleteer = Completer();

  newCompleteer.future;

  newCompleteer.complete("success");

  newCompleteer.completeError("this is erro");
}

void main(List<String> args) async {
  try {
    final delaySeconds = returnDelaySeconds();

    // await printDelayWithCustomDuration(delaySeconds);

    print("1. This is the 2nd  something");
  } catch (e) {}
  // var printinStuff =

  // returnDelaySeconds().then((duration) {

  //   printDelayWithCustomDuration(duration);
  // });

  // print(printinStuff);
  // .then(
  //   (value) {
  //     print(value);
  //   },
  // ).catchError((e) {
  //   print(e);
  // });
}

// async await
