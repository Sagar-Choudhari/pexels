import 'package:flutter/material.dart';
import 'package:pexels/Views/follow_feed.dart';
import '../Service/colors.dart';
import 'global_feed.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.darkGrey,
      /*appBar: AppBar(
        backgroundColor: appColors.darkGrey,
        shadowColor: Colors.transparent,
        title: Text(
          "Browse",
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: appColors.blue1,
            decorationThickness: 2,
            shadows: [Shadow(color: appColors.white, offset: const Offset(0, -5))],
          ),
        ),
      ),*/
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: const [
                TabBar(
                  tabs: [
                    Tab(text:'Global'),
                    Tab(text: 'Follow'),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    children: [
                      GlobalFeed(),
                      FollowFeed(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

