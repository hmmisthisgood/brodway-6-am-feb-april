main() {
  print("Hello world");

//// int , double, num, bool, String, dynamic
// explicit type definition
  int number;
  number = 10;
  number = 100;

  double decimalValue = 10;
  print(decimalValue); // 10.0

  num aNumber = 10.0;
  aNumber = 10;

  String text = "this is a string";
  String multiLIne = """multi 
  line 
  string 

     """;

  // print(multiLIne);

  bool booleanValue = true; //false

  /// dangennerorus data type
  dynamic someDyanmicValue = "this";
  print(someDyanmicValue);
  someDyanmicValue = 10;
  print(someDyanmicValue);

  someDyanmicValue = false;
  print(someDyanmicValue);

  someDyanmicValue = 10.0;

  // if (someDyanmicValue) {
  //   print("this is dynamic value");
  // }

  /// implicit type defintion
  var someVariable = true;
  // someVariable = 10;

//  null and void
  int? nullVAlue = null;

// final and const

  /// final sets value in runtime
  final name = "Dipseh";
  // name = "Dip";

  final currentTime = DateTime.now();

  // currentTime = DateTime.now();

  /// const sets value in compile time
  const pi = 3.14;
  // pi = 3.1415;
}
