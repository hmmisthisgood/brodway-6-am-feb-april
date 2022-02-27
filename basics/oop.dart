class User {
// class defines 2 things
//1. attributes
//2. behavirous/actions

  /// variables

  int _id;
  String _email;
  String _fullName;
  String _role;
  String? _profilePicture;

  User(
      {required int di,
      required String email,
      required String role,
      String? profilePic,
      required String fullName})
      : _id = di,
        _email = email,
        _role = role,
        _profilePicture = profilePic,
        _fullName = fullName;

  // getId() {
  //   return _id;
  // }

  // setId(int id) {
  //   _id = id;
  // }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

//  Default constructor
// Attributes/functions

  /// functions or methods

  login() {
    print(" user with name $_fullName has just logged in");
  }

  logOut() {
    print(" user with name $_fullName has just logged  out");
  }

  sendMessage() {
    print("  $_fullName is sending message");
  }
}

// class and

// objects/instances

/// Admin class = sub class, inheriting class
/// User class= base class or super class
class Admin extends User {
  Admin(
      {required int id,
      required String fullname,
      required String profilePicture,
      required String email})
      : super(
            di: id,
            fullName: fullname,
            profilePic: profilePicture,
            role: "admin",
            email: email);

  delete() {}
  update() {}

  @override
  login() {
    print("This is admin loggin in");

    // return super.login();
  }
}

class Customer extends User {
  Customer(
      {required int id,
      required String fullname,
      required String profilePicture,
      required String email})
      : super(
            di: id,
            fullName: fullname,
            profilePic: profilePicture,
            role: "customer",
            email: email);

  create() {
    print("Customer $_fullName is creating sutff");
  }

  list() {
    print("Customer $_fullName is lisitng sutff");
  }

  @override
  login() {
    print("Customer is signing in");
    // return super.login();
  }
}

abstract class CustomClass {
  login({required String username, required String password});
  logOut({required String email});
}

class NewCustomClass extends CustomClass {
  @override
  logOut({required String email}) {}

  @override
  login({required String username, required String password}) {}
}

postitionalArg(int value, String what) {}

namedArg({required int arg1, required String arg2}) {}

mixedArgs(String positional, {int? named}) {}

void main(List<String> args) {
  final adminUser = new Admin(
      id: 1234,
      profilePicture: "https://a.jpg",
      fullname: "Dipesh",
      email: "A@n.com");

  print("\n\n");
  adminUser.login();

  adminUser.logOut();
  adminUser.sendMessage();

  print("\n\n");

// admin's diffrences with User class
  adminUser.update();
  adminUser.delete();

  final customerUser = new Customer(
      id: 1234,
      profilePicture: "https://a.jpg",
      fullname: "Jack customer",
      email: "A@n.com");
  print("\n\n");

  customerUser.login();
  customerUser.list();
  customerUser.create();

  postitionalArg(10, "string");

  namedArg(arg1: 1, arg2: "this sis arg 2");

  mixedArgs("this is posisional");
}
