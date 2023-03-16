import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:pexels/Service/colors.dart';
import 'package:pexels/Views/home.dart';
import 'package:pexels/Views/login.dart';
import 'package:pexels/Views/notification.dart';
import 'package:pexels/Views/profile.dart';
import 'package:pexels/Views/search.dart';
import 'package:pexels/Views/upload.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() {
    return _BottomNavigationState();
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _selectedIndex = 0;

  List<Widget> tabItems = [
    const Home(),
    const Search(),
    // const Upload(),
    const Login(),
    const Notify(),
    const Profile()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    AppColors appColors = AppColors();
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        animationDuration: const Duration(milliseconds: 370),
        animationCurve: Curves.linear,
        backgroundColor: appColors.darkGrey,
        shadows: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
        showElevation: true,
        iconSize: 27,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home_rounded),
            title: const Text('Home'),
              activeColor: appColors.white,
              inactiveColor: appColors.lightGrey,

          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.search),
            title: const Text('Search'),
            activeColor: appColors.white,
            inactiveColor: appColors.lightGrey,
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.add_circle),
            title: const Text('Upload'),
            activeColor: appColors.white,
            inactiveColor: appColors.lightGrey,
          ),
          FlashyTabBarItem(
            icon: const Icon(CupertinoIcons.bell_fill),
            title: const Text('Notification'),
            activeColor: appColors.white,
            inactiveColor: appColors.lightGrey,
          ),
          FlashyTabBarItem(
            icon: const Icon(CupertinoIcons.person_crop_circle),
            title: const Text('Profile'),
            activeColor: appColors.white,
            inactiveColor: appColors.lightGrey,
          ),
        ],
      ),
      body: Center(child: tabItems[_selectedIndex]),
    );
  }
}
