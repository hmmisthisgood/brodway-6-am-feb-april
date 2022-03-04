import 'package:flutter/material.dart';

import 'gridview.dart';
import 'listview.dart';
import 'stateful.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentTabIndex = 0;
  final _pageController = PageController();
  bool showBottomNavBar = true;

  List<IconData> bottomItems = [
    Icons.home,
    Icons.image_outlined,
    Icons.wallet_giftcard,
    Icons.person
    // Icons.person
  ];

  onPressedBottomNavbarItem(int index) {
    _currentTabIndex = index;
    print("current tab index: $_currentTabIndex");
    _pageController.jumpToPage(index);

    // 1.5
    // _pageController.animateToPage(index,
    //     duration: Duration(milliseconds: 4000), curve: Curves.ease);
    setState(() {});
  }

  toggleBottomNavBar() {
    showBottomNavBar = !showBottomNavBar;
    setState(() {});
  }

  Widget buildDefaultNavigationBar() {
    return Container(
      height: 60,
      color: Colors.green,
      child: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.purple,
        selectedIconTheme: IconThemeData(
          color: Colors.purple,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.black),

        ///most descriptive , clear
        // onTap: (index) {
        //   onPressedBottomNavbarItem(index);
        // },

        /// concise
        // onTap: onPressedBottomNavbarItem,

        ///uses arrrow back
        onTap: (index) => onPressedBottomNavbarItem(index),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.wallet_giftcard), label: ""),
        ],
      ),
    );
  }

  buildAnimatedNaviationBar() {
    return AnimatedBottomNavigationBar(
        backgroundColor: Colors.pink,
        icons: bottomItems,
        activeIndex: _currentTabIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        activeColor: Colors.white,
        inactiveColor: Colors.black,
        iconSize: 30,
        onTap: (pressedIconIndex) {
          onPressedBottomNavbarItem(pressedIconIndex);
        }
        //other params
        );
  }
  // cutout= notch

  @override
  Widget build(BuildContext context) {
    // Icon = widget
    // Icons = IconsData (name of the icons we use)
    // IconButton = Icon widget which can be clicked

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            toggleBottomNavBar();
          },
          child: Icon(Icons.search),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: InkWell(
            onTap: () {
              toggleBottomNavBar();
            },
            child: PageView(
              controller: _pageController,
              // physics: NeverScrollableScrollPhysics(),
              onPageChanged: (pageIndex) {
                _currentTabIndex = pageIndex;
                setState(() {});
              },
              children: [PostsListView(), GridViewScreen(), Newhomepage()],
            ),
          ),
        ),
        bottomNavigationBar: showBottomNavBar == false
            ? Container(height: 0, width: 0)
            : buildAnimatedNaviationBar());
  }
}
// BottomAppBar ( )
// BottomNavigationBar
