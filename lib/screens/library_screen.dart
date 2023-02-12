import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_library_task/const.dart';
import 'package:flutter_library_task/screens/technical_form_screen.dart';
import 'package:flutter_library_task/state_manage/cubit/home_cubit.dart';

import '../state_manage/cubit/tags_cubit.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/library_home_view.dart';
import '../widgets/tags_home_view.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    var cHeight = MediaQuery.of(context).size.height;
    var cWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(cWidth: cWidth),
            BlocBuilder<TagsCubit, TagsState>(
              builder: (context, state) {
                if (state is HomeTagSuccess) {
                  return TagsHomeView(data: state.data);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLibarySuccess) {
                  return LibraryHomeView(data: state.data);
                } else {
                  return Text('oppes');
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<TagsCubit>(context).getTags();
    BlocProvider.of<HomeCubit>(context).getLibrary();

    super.initState();
  }
}
