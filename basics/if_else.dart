main() {
  if (2.isEven) {
    print("2 is even");
  }

  if (1.isEven) {
    print("1 is even");
  } else {
    print("1 is odd");
  }

  String day = "Friday";

  if (day == "Sunday") {
    print(day);
  } else if (day == "Monday") {
    print(day);
  } else if (day == "Monday" && 1 / 2 == 0.5 && 1 / 4 == 0.25) {
    print(day);
  } else if (day == "Monday") {
    print(day);
  } else if (day == "Monday") {
    print(day);
  } else {
    print(day);
  }

  switch (day) {
    case "Sunday":
      print("This day is Sunday");
      break;
    case "Monday":
      print("This day is Monday");
      break;
    default:
      print("These are the other days");
      break;
  }
}
