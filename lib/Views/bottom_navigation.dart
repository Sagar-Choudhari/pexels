import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:pexels/Service/colors.dart';
import 'package:pexels/Views/follow_feed.dart';
import 'package:pexels/Views/home.dart';
import 'package:pexels/Views/notification.dart';
import 'package:pexels/Views/profile.dart';
import 'package:pexels/Views/search.dart';
import 'package:material_dialogs/material_dialogs.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
    const Text('Upload select'),
    // const Login(),
    // CustomDialogBox(),
    const Notify(),
    const Profile()
  ];

  @override
  void initState() {
    super.initState();
  }

  late File _image;
  final picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        Navigator.pop(context);
        _image != null
            ? showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: Colors.transparent,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: appColors.blue4
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: FileImage(_image),
                        // ),
                        ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            height: 450,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: FileImage(_image),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                          child: ElevatedButton(
                            onPressed: (){ Navigator.pop(context);
                            print(MediaQuery.of(context).size.width);
                            print(MediaQuery.of(context).size.width * 0.8);
                            print(MediaQuery.of(context).size.height);
                            print(MediaQuery.of(context).size.height * 0.6);
                            print(MediaQuery.of(context).size.height * 0.5);
                            print(MediaQuery.of(context).size.height * 0.7);
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(35),
                            ),
                            child: const Text('Upload')
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: (){ getImage(); },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(155, 30),
                                    backgroundColor: Colors.teal
                                  ),
                                  child: const Text('Select Another')
                              ),
                              ElevatedButton(
                                  onPressed: (){ Navigator.pop(context); },
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(155, 30),
                                      backgroundColor: Colors.red,
                                  ),
                                  child: const Text('Cancel')
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              )
            : Dialogs.materialDialog(
                lottieBuilder: Lottie.asset(
                  'assets/27938-upload-files.json',
                  height: 300,
                  fit: BoxFit.cover,
                ),
                context: context,
              );
      });
    } else {
      debugPrint('No image selected.');
    }
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
          if (index == 2) {
            Dialogs.materialDialog(
                color: appColors.blue4,
                msg: 'Select image from your device by clicking button.',
                msgStyle: TextStyle(
                  color: appColors.white,
                ),
                title: 'Select & Upload Image',
                titleStyle: TextStyle(
                    color: appColors.white, fontWeight: FontWeight.bold),
                lottieBuilder: Lottie.asset(
                  'assets/27938-upload-files.json',
                  fit: BoxFit.contain,
                ),
                context: context,
                actions: [
                  IconsButton(
                    onPressed: () {
                      getImage();
                    },
                    text: 'Select Image',
                    iconData: Icons.done,
                    color: Colors.blue,
                    textStyle: const TextStyle(color: Colors.white),
                    iconColor: Colors.white,
                  ),
                ]);
          } else {
            _selectedIndex = index;
          }
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
