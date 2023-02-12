import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_library_task/api/api_servece.dart';

import '../../models/tag_model/tag_model.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  TagsCubit(this.api) : super(TagsInitial());

  final Api api;

  dynamic getTags() async {
    emit(HomeTagLoading());
    try {
      List<TagModel> data = await api.getTag();

      emit(HomeTagSuccess(data: data));
    } catch (e) {
      emit(HomeTagField(errMasege: e.toString()));
    }
  }
}
