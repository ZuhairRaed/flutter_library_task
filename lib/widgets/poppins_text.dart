import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PoppinsText extends StatelessWidget {
  PoppinsText({super.key, required this.text, this.size, this.color, this.fontWeight});
  final String text;
  double? size;
  Color? color;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: "Poppins", 
      fontSize: size,
      fontWeight: fontWeight,
      color: color),
    );
  }
}