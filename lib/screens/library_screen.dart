import 'package:flutter/material.dart';
import 'package:flutter_library_task/screens/technical_form_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.support_agent),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TechnicalFormScreen()));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Your Design Here'),
      ),
    );
  }
}
