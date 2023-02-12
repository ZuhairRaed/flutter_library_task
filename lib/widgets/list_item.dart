import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/poppins_text.dart';


class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.icon, required this.title, required this.description});
  final int icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10),
      // color: Colors.yellow,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Image.asset(icon == 1 ? "assets/images/pdf.png": icon == 2 ? "assets/images/video.png" : "assets/images/doc.png" ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsText(text: title, color: const Color(0xff075995), fontWeight: FontWeight.normal, size: 19,),
                PoppinsText(text: description, color: const Color(0xff757575), size: 16,),
              ],
            )
            
          ],
        ),
      ),
    );
  }
}