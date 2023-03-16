import 'package:flutter/material.dart';

import '../Service/colors.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  final AppColors appColors = AppColors();

  List<String> items = [
    'Lorem ipsum dolor sit amet',
    'Consectetur adipiscing elit',
    'Sed do eiusmod tempor incididunt',
    'Ut labore et dolore magna aliqua',
    'Ut enim ad minim veniam',
    'Quis nostrud exercitation ullamco laboris',
    'Nisi ut aliquip ex ea commodo consequat',
    'Duis aute irure dolor in reprehenderit',
    'Voluptate velit esse cillum dolore',
    'Eu fugiat nulla pariatur',
    'Excepteur sint occaecat cupidatat non proident',
    'Sunt in culpa qui officia deserunt mollit anim id est laborum',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.darkGrey,
      appBar: AppBar(
        backgroundColor: appColors.darkGrey,
        shadowColor: Colors.transparent,
        title: Text(
          'Notification',
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: appColors.blue1,
            decorationThickness: 2,
            shadows: [
              Shadow(color: appColors.white, offset: const Offset(0, -5))
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(color: appColors.white),
                ),
                subtitle: Text(
                  'Item $index subtitle',
                  style: TextStyle(color: appColors.lightGrey),
                ),
                leading: Icon(
                  Icons.notification_add_outlined,
                  color: appColors.blue2,
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: appColors.lightGrey,
              height: 2,
            ),
          )),
    );
  }
}
