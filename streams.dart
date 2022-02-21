import 'dart:async';

StreamController<int> streamController = StreamController<int>();

int initialDAta = 0;
addDataInStream() {
  Timer.periodic(Duration(milliseconds: 800), (timer) {
    initialDAta++;

    streamController.add(initialDAta);
  });
}

void main(List<String> args) {
  addDataInStream();
  streamController.stream.listen((data) {
    print(data);
  });
}
