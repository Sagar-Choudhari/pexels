import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexels/Views/profile_tabs.dart';
import '../Service/colors.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColors.darkGrey,
        appBar: AppBar(
          backgroundColor: appColors.darkGrey,
          shadowColor: Colors.transparent,
          title: Text(
            'My Profile',
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
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert_rounded, color: appColors.white,),
              tooltip: 'Profile Menu',
              color: appColors.blue1,
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.settings, color: appColors.black, size: 20),
                        const SizedBox(width: 7),
                        Text(
                          'Settings',
                          style: TextStyle(fontSize: 15, color: appColors.black, fontWeight: FontWeight.bold,),
                        ),
                      ],
                    )
                  ),
                  PopupMenuItem(
                    value: 2,
                      child: Row(
                        children: [
                          Icon(Icons.settings, color: appColors.black, size: 20),
                          const SizedBox(width: 7),
                          Text(
                            'Settings',
                            style: TextStyle(fontSize: 15, color: appColors.black, fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                  ),
                  PopupMenuItem(
                    value: 3,
                      child: Row(
                        children: [
                          Icon(Icons.logout_rounded, color: appColors.black, size: 20),
                          const SizedBox(width: 7),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 15, color: appColors.black, fontWeight: FontWeight.bold,),
                          ),
                        ],
                      ),
                  ),
                ];
              },
              onSelected: (value) {
                // Do something when a menu item is selected
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: appColors.blue4,
                backgroundImage: const NetworkImage(
                    "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a89c3e38-b6f3-48a0-9f9e-df9a0129fb93/daghh5x-4a77b3ec-fd4f-4d17-9f84-5963a8cb5c03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4OWMzZTM4LWI2ZjMtNDhhMC05ZjllLWRmOWEwMTI5ZmI5M1wvZGFnaGg1eC00YTc3YjNlYy1mZDRmLTRkMTctOWY4NC01OTYzYThjYjVjMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dWTFMrwnbAbj5TtUp9U_vQsohW7MnkRPymzR5wZQoV8"),
                radius: 65,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Sagar Choudhary',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: appColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 27),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'Views',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: appColors.blue1,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '23',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: appColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: appColors.blue1,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          )),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '273',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: appColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 21,
                          )),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Post',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: appColors.blue1,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '27',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: appColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                      )),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 18),
            const ProfileTabs(),
          ],
        ),
      ),
    );
  }
}
