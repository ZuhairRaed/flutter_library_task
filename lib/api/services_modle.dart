import 'package:flutter_library_task/api/services.dart';
import 'package:flutter_library_task/variabels/library.dart';
import 'package:flutter_library_task/variabels/tags.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureProvider<List<Tags>> tagsDataProvider =
    FutureProvider<List<Tags>>((ref) async {
  return ref.read(tagsProvider).getData();
});

FutureProvider<List<Library>> libraryDataProvider =
    FutureProvider<List<Library>>((ref) async {
  return ref.read(libraryProvider).getData();
});
