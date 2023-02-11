import 'package:flutter/material.dart';

class TextFieldTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  const TextFieldTitle({Key? key, required this.title, this.isRequired = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff009BA6),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
      ],
    );
  }
}
