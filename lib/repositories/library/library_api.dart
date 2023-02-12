import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_library_task/models/library_data_model.dart';
import 'package:flutter_library_task/models/library_tags_model.dart';
import 'package:flutter_library_task/repositories/library/library_repository.dart';

import '../../res/utils.dart';

class LibraryAPI extends LibraryRepository{

  final Dio dio = Dio();


  @override
  Future<List<LibraryTagsModel>> getLibraryTags() async{
    List<LibraryTagsModel> result = [];
    try {
      Response response = await dio.get(libraryTags);
      List<dynamic> data = response.data as List<dynamic>;
      for (var tag in data) {
        final LibraryTagsModel libraryTagsModel = LibraryTagsModel.fromJson(tag);
        result.add(libraryTagsModel);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<LibraryDataModel>> getLibraryDataByTagId(int tagId) async{
    List<LibraryDataModel> result = [];
    try {
      Response response = await dio.get(libraryData,queryParameters: {
        'tagId':tagId,
      });
      List<dynamic> data = response.data as List<dynamic>;
      for (var libraryData in data) {
        final LibraryDataModel libraryDataModel = LibraryDataModel.fromJson(libraryData);
        result.add(libraryDataModel);
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }



}