main() {
  /// List = (equivalnet of arrray, arralylist )
  /// Map = (equivalent of HashMap, Dictionary, Js Objecct)
  /// Set
  /// class/object

//  somewhat  explicit type definition
  List simpleList = [1, 1, 1, 1, 1, 1, 1, "two", "three", 4.0, true, false];

  simpleList.forEach((element) {});

  Set simpleListSet = simpleList.toSet();
  print(simpleListSet);

//  100% explicit type definition
  List<int> intList = [1];

  //  implicit type defition
  /// 0,1,2
  var imList = [1, 2, 3535, 46454];

  var listValue = imList[1];

  print(" the 4th item of list is:  ${imList[3]}");

//  Map date type
// MapEntry =  key & value pair
// map with dynamic keys and dynamic values

  Map<String, dynamic> weather = {
    "temperature": "20", // MapEntry
    "hasRain": "true",
    "100": "500",
  };
  print(weather);
  weather.forEach((key, value) {});

  // MapEntry<String, dynamic> mapEntry = MapEntry("sunrise", DateTime.now());

  // weather.addEntries([mapEntry]);

  weather['sunrise'] = DateTime.now();

  print(weather);

  Map<dynamic, dynamic> address = {
    "name": "Kathmandu", // MapEntry
    "province": "3",
    "zone": "Bagmati",
    15: "this is something"
  };

//  accessing values of a map with ther keys
  var city = address["name"];
  var something = address[15];

  print("city is : $city");

  final keys = address.keys.toList();
  final values = address.values.toList();

  /// adding values in a map

  address["name"] = "Pokhara";

  // adding new keys
  address['latitude'] = 27.111111;
  print(address);

  // removing value
  address.remove(15);
  print(address);

  Set customSet = {1, 2, 3, 1, 1, 1};

  // customSet.forEach((e) {});

  simpleList.map((e) {});

  // weather.map((k, v) {});

  customSet.map((v) {});

  print("this is set: $customSet");
}
