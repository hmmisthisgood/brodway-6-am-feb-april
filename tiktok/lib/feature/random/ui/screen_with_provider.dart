import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/feature/auth/provider/auth_provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({Key? key}) : super(key: key);

  // AuthProvider provider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.updateCount();
          // provider.googleSignIn();
          Get.snackbar(
            "this is a snackbar",
            "thi is a message",
            colorText: Colors.black,
          );
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Consumer<AuthProvider>(
          builder: (context, state, child) {
            print(" New change in consumer");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("The added value is"),
                Text(state.count.toString()),
                state.isLoading
                    ? CircularProgressIndicator()
                    : Text("Login success")
              ],
            );
          },
        ),
      ),
    );
  }
}
