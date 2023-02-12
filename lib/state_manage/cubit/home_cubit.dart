// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_library_task/api/api_servece.dart';
import 'package:flutter_library_task/models/library_model/library_model.dart';
import 'package:flutter_library_task/models/tag_model/tag_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<LibraryModel> dataCubit = [];
  int? checkId = 0;
  HomeCubit(
    this.api,
  ) : super(HomeInitial());

  final Api api;

  dynamic getLibrary() async {
    emit(HomeLibaryLoading());
    try {
      List<LibraryModel> data = await api.getLibrary();
      emit(HomeLibarySuccess(data: data));
    } catch (e) {
      emit(HomeLibaryField(errMasege: e.toString()));
    }
  }
}
