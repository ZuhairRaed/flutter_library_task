import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_task/api/api_servece.dart';
import 'package:flutter_library_task/state_manage/cubit/home_cubit.dart';
import 'package:flutter_library_task/state_manage/cubit/tags_cubit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'screens/library_screen.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
      child: MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeCubit(Api(dio: Dio())),
      ),
      BlocProvider(
        create: (context) => TagsCubit(Api(dio: Dio())),
      ),
    ],
    child: const MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
