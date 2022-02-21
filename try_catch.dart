class NoInternetException {
  String message;
  NoInternetException({required this.message});
}

throwIntenetException() {
  // throw NoInternetException(message: "this is error message");
  throw "some other exception";
}

main() {
  var infi = 1 / 0;
  print(infi);

  try {
    throwIntenetException();
  } on NoInternetException catch (e) {
    print("there is no internet");
  } catch (e) {
    print(e.toString());
  } finally {}

  print("print this stuff below exception");
}
