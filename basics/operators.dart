void main() {
  /// +, -, *, /, %,

  final text = "this" + "that";
  print(text);

  //  ++ , -- ,
  int a = 1;
  a++;
  a--;

  ++a;
  --a;

  ///  == : equality, checks both type and value
  /// != : not equal
  //  && : AND  adding mutliple conditions in if or boolean checks
  //  ||  : OR
//  <, > , <=, >= : comparison

  /// ternary operator
// (test) ?some_statment: else statement

  int number = 11;

  number == 11 ? print("number is 11") : print("number is not 11");

  // number == 10
  //     ? print("number is 10")
  //     : print("number is not 10");

//  ?. , ?? , ! , ?

  String? value; // "some value" or null

  // if (value != null) {
  // int valueLength = value!.length;

  // print(valueLength);

  String newValue = value ?? "";
  print(newValue);
}
