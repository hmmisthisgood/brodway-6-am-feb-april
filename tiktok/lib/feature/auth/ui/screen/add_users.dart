import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/common/utils/db_service.dart';
import 'package:jiffy/jiffy.dart';

class Addusers extends StatefulWidget {
  const Addusers({Key? key}) : super(key: key);

  @override
  State<Addusers> createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  List users = [];
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            MaterialButton(
              color: Colors.green,
              child: Text("Add user"),
              onPressed: () async {
// firstName  VARCHAR(20),
// lastName   VARCHAR(20),
// createdAt   VARCHAR,
// isAdmin   INT,
// email     VARCHAR

                Map<String, dynamic> user = {
                  "firstName": "test ",
                  "lastName": "user",
                  "createdAt": DateTime.now().toUtc().toString(),
                  "isAdmin": "FAlSE",
                  "email": "test@test.com"
                };
                await DbService.instance.insertUser(user);
              },
            ),
            MaterialButton(
              child: Text("get users"),
              color: Colors.yellow,
              onPressed: () async {
                users = await DbService.instance.getUsers();
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
// 2022 january 12
                    final _date =
                        Jiffy(user['createdAt']).format("yyyy MMM dd");

                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  user['firstName'] + " " + user['lastName'],
                                  style: txt.headline4,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await DbService.instance
                                          .deleteUser(user["id"]);
                                      users =
                                          await DbService.instance.getUsers();
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            ),
                            Text(user['email']),
                            SizedBox(height: 8),
                            Text(user['isAdmin'] == 0 ? "Admin" : "Customer"),
                            SizedBox(height: 8),
                            Text(_date),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
