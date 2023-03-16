import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexels/Service/colors.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    AppColors appColors = AppColors();
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text:'Media'),
                Tab(text: 'Collection'),
              ],
            ),
            Flexible(
              child: TabBarView(
                children: [
                  Center(
                    child: Text('Content for Tab 1', style: GoogleFonts.openSans(
                        textStyle: TextStyle(color: appColors.white, fontSize: 28, fontWeight: FontWeight.bold ))
                    ),
                  ),
                  Center(
                    child: Text('Content for Tab 1', style: GoogleFonts.openSans(
                        textStyle: TextStyle(color: appColors.white, fontSize: 28, fontWeight: FontWeight.bold ))
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
