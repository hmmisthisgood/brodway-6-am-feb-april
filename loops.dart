void main(List<String> args) {
// for
  int i = 0;
  List<String> days = ["Sum", "Mon", "Tue"];

  for (i; i < 3; i++) {
    // var day = days[i];
    // days.remove("Sum");
    // print(i);
  }

// i=100;

//  for in

  for (String item in days) {
    // days.remove("Sum");
    // print(item);
  }

  // print("For each \n\n");

// for each
  days.forEach((i) {
    // print(i);
    // var success = days.remove("Sun");
  });

// while
// Warning/ TODO: do not add infinite loop in your code
  // while (i < 5) {
  //   ///
  //   ///

  //   print("this");
  // }

// do while

  // do {} while (i < 5);

  //  map function

  /// map function: available in List, Map, Set

  List newDays = days.map((e) {
    print("inside map : $e");
    final anotherDay = e + "day";
    return anotherDay;
  }).toList();

  print(newDays);

  // List reversedList =

  Map places = {
    "name": "ktm", //MapEntry
    "populatino": 1000000,
    "isPolluted": true,
  };

  Map newplaces = places.map((key, value) {
    return MapEntry(key, "this is the updated value");
  });

  places.containsKey("name");
  // places.putIfAbsent("name", "pok");
  

// where, firstWhere, indexWhere,

  print(places);
  print(newplaces);
}
