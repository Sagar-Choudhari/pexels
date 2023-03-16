import 'package:flutter/material.dart';

import '../Service/colors.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColors.darkGrey,
        shadowColor: Colors.transparent,
        title: Text('Upload',
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            decoration: TextDecoration.underline,
            decorationColor: appColors.blue1,
            decorationThickness: 2,
            shadows: [Shadow(color: appColors.white, offset: const Offset(0, -5))],
          ),),
      ),
    );
  }
}
