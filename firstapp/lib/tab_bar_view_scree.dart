import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController customTabContoller;
  @override
  void initState() {
    super.initState();
    customTabContoller = TabController(length: 8, vsync: this);
  }

  final List<String> allTabTitles = [
    "All",
    "Trending",
    "Games",
    "Movies",
    "All",
    "Trending",
    "Games",
    "Movies",
  ];

  List<Widget> convertTabItems() {
    return List.generate(allTabTitles.length, (index) {
      final currentTab = allTabTitles[index];

      return Column(
        children: [
          Text(currentTab),
          Icon(Icons.home),
        ],
      );
    });
  }

  List<Widget> convertListToTabViews() {
    return allTabTitles.map((e) {
      return Container(
        child: Center(child: Text(e)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    /// contansts

    return Scaffold(
        appBar: AppBar(
          title: Text("Our app"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Container(
              color: Colors.grey,
              child: TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 5,
                indicator: BoxDecoration(),
                isScrollable: true,
                tabs: convertTabItems(),
                controller: customTabContoller,
                onTap: (index) {
                  print("this index is tapped: $index");

                  /// can perform any action
                  // customTabContoller.animateTo(0);
                },
              ),
            ),
          ],
        )
        // TabBarView(
        //   children: convertListToTabViews(),
        //   controller: customTabContoller,
        // ),
        );
  }

  @override
  bool get wantKeepAlive => false;
}
