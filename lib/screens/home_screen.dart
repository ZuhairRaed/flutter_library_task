import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/filter_container.dart';

class HomeScreen extends StatefulWidget {
  final String yourName;
  const HomeScreen({super.key, required this.yourName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            SizedBox(height: 100,),
            FilterContainer(text: "ahmad", isSelected: true),
            FilterContainer(text: "moath", isSelected: false),
          ],
        ),
      ),
    );
  }
}
