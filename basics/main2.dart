import 'dart:ffi';

/// this is a main function
main() {
  print("hello world");

  // -345566 ... 0 1,2...... +345566
// 0,2,3,---- 644322
  int? someValue; // either int or null
  // = 10;

  int number = 10; // this is declaration and definition
  // Uint8, Uint16, Uint32,  thisIsUInt8

  number = 11;
  number = 12;

  String stringNumber = "10";
// data types = primitive and derived

  // int, double, String , bool, num

  double doubleValue = 10;

  num numberValue = 19.0;
  numberValue = 10;

/*
this 
is a
multiline comment
*/
  ///
  print(doubleValue);
  String stringValue = "";
  stringValue.length;

  print("length of stringValue is ${stringValue.length} ");

  bool trueValue = true;
  bool falseValue = false;

  if (trueValue is bool) {
    print("trueValue is bool");
  }

  // single line or multi line string

  String singleLine = 'this is ';

  String multiLine = ''' 
  
  this 
  is 
  a 
  multi 
  line 
  string
  
  ''';

//  dynamic data type
// implicit type definition.
// compiler infers the type from defined value
  var varValue = 10;

  /// not possible
  // varValue = "String";

  dynamic dynamicValue = 10;
  print("dynamic value: $dynamicValue");

  dynamicValue = "String";

  print("dynamic value: $dynamicValue");
//

//  final & const

//  final is defined in runtime
  final currentTime = DateTime.now();
  // currentTime = DateTime.now();

  //  const values are defined in compile time
  const pi = 3.14;
  // pi = 3.1415;



}
