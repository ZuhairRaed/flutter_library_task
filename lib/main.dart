import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/library_screen.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Consumer(
      builder: (context, ref, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          locale: Locale('en'),
          home: LibraryScreen(),
        );
      },
    );
  }
}
// 
