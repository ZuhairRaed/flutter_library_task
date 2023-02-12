import 'package:flutter/material.dart';
import 'package:flutter_library_task/repositories/library/library_api.dart';
import 'package:flutter_library_task/view_model/library_view_model.dart';
import 'package:provider/provider.dart';

// import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'views/library_view.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(const ProviderScope(child: MyApp()));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LibraryViewModel(
            libraryRepository: LibraryAPI(),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            foregroundColor: Color(0xFF075995),
            titleTextStyle: TextStyle(
              color: Color(0xFF075995),
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              // height: 30.0,
            )),

        colorScheme: ColorScheme.fromSwatch().copyWith(
          // background: Color(0xFFE0E0E0),
          background: Colors.white,
          primary: const Color(0xFF075995),
        ),
      ),
      locale: const Locale('en'),
      home: const LibraryView(),
    );
  }
}
