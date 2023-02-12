// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import '../models/library_model/library_model.dart';
import '../models/tag_model/tag_model.dart';

class Api {
  Dio dio;
  Api({
    required this.dio,
  });

  final String baseUrl = 'https://development.himam.com/api';
  Future<dynamic> getLibrary() async {
    try {
      Response response = await dio.get('$baseUrl/library');

      List<LibraryModel> listData = [];

      for (var d in response.data) {
        listData.add(LibraryModel.fromMap(d));
      }
      return listData;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getTag() async {
    try {
      Response response = await dio.get('$baseUrl/library/tags');

      List<TagModel> listData = [];

      for (var d in response.data) {
        listData.add(TagModel.fromMap(d));
      }
      return listData;
    } catch (e) {
      return e;
    }
  }
}
