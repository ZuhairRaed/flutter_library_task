import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
            appBar: AppBar(
              title: const Text('Congratulations'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Congratulations ${widget.yourName} You did it!',
                      style: const TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      )),
                  const SizedBox(height: 16),
                  const Text(
                      'You passed the exam with flying colors. Your hard work and dedication have paid off. Keep up the great work!',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 14,
                      )),
                ],
              ),
            )),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: controller,
            blastDirection: pi / 2,
            blastDirectionality: BlastDirectionality.explosive,
            maxBlastForce: 10,
            minBlastForce: 1,
            emissionFrequency: 0.04,
            numberOfParticles: 20,
            gravity: 0.2,
            shouldLoop: true,
            colors: const [
              Colors.green,
              Colors.yellow,
              Colors.pink,
              Colors.orange,
              Colors.blue
            ],
            createParticlePath: (size) {
              final path = Path();
              path.addOval(Rect.fromCircle(
                  center: Offset(0, size.height / 2), radius: 5));
              return path;
            },
          ),
        ),
      ],
    );
  }
}
