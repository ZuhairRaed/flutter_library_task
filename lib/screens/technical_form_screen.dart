import 'package:flutter/material.dart';
import 'package:flutter_library_task/widgets/text_field_title.dart';

import 'home_screen.dart';

class TechnicalFormScreen extends StatelessWidget {
  const TechnicalFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextFieldTitle(title: 'Password'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 16),
            const TextFieldTitle(title: 'Email'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 16),
            const TextFieldTitle(title: 'Issue Description'),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your issue description',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(yourName: 'moath',)),
                );
                // Your code here
              },
              child: Text('Submit'),
            )
          ],

        ),

      ),
    );
  }
}
