import 'package:flutter/material.dart';
import 'package:flutter_library_task/const.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.cWidth,
  }) : super(key: key);

  final double cWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 45, right: cWidth / 73.36, top: 41, bottom: 31.93),
      child: const Text(
        'Library',
        style: TextStyle(
            color: ConstManager.kPrimaryFont,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
            fontStyle: FontStyle.normal),
      ),
    );
  }
}
