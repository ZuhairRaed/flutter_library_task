import '../../models/library_data_model.dart';
import '../../models/library_tags_model.dart';

abstract class LibraryRepository{


  Future<List<LibraryTagsModel>> getLibraryTags();
  Future<List<LibraryDataModel>> getLibraryDataByTagId(int tagId);


}