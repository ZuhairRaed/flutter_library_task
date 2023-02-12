import 'package:flutter/material.dart';
import 'package:flutter_library_task/repositories/library/library_repository.dart';
import 'package:flutter_library_task/res/components.dart';

import '../models/library_data_model.dart';
import '../models/library_tags_model.dart';

class LibraryViewModel with ChangeNotifier {

  final LibraryRepository libraryRepository;
  LibraryViewModel({required this.libraryRepository});


  bool isLoading = true;
  set setIsLoading(bool newValue){
    isLoading = newValue;
  }

  List<LibraryTagsModel> libraryTags = [];
  void setLibraryTags(List<LibraryTagsModel> newValue){
    libraryTags = newValue;

  }

  int selectedTag = 0;
  set setSelectedTag(int newValue){
    selectedTag = newValue;
    _notify();
  }

  Map<int,List<LibraryDataModel>> libraryData = {};

  Future<void> getLibraryTags(BuildContext context)async{
    List<LibraryTagsModel> result = [];
    try{
      result = await libraryRepository.getLibraryTags();
      for (LibraryTagsModel tag in result) {
        List<LibraryDataModel> singleTagData = await libraryRepository.getLibraryDataByTagId(tag.id!);
        libraryData.putIfAbsent(tag.id!, () => singleTagData);
      }
      setIsLoading = false;
      _notify();
    }catch(e){
      Components.errorDialog(context,text: 'Cannot get library tags',);
    }
    setLibraryTags(result);
  }


  void _notify(){
    notifyListeners();
  }

}
