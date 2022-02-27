import 'package:flutter/material.dart';

class Newhomepage extends StatefulWidget {
  @override
  _NewhomepageState createState() => _NewhomepageState();
}

class _NewhomepageState extends State<Newhomepage> {
  Color backgroundColor = Colors.green;

  /// Function can also be defined this way
  // Function changeThebgColor = () {};

  // void changeThebgColor() {
  //   print(backgroundColor);

  //   setState(() {
  //     backgroundColor = Colors.yellow;
  //   });
  // }

  ///
  /// initstate is called at first/beginnning. It is called only 1 time unlike build.
  ///

  @override
  void initState() {
    super.initState();

    print("iniit state called");
  }


  ///

  @override
  void didUpdateWidget(covariant Newhomepage oldWidget) {
    print("did update called");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print("did change depencies");
    super.didChangeDependencies();
  }

  ///

  @override
  void dispose() {
    super.dispose();


  }

  ///

  @override
  Widget build(BuildContext context) {
    print("build function called");

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(backgroundColor);

        setState(() {
          backgroundColor = Colors.yellow;
        });
        
      }),
      body: Container(color: backgroundColor),
    );
  }
}

