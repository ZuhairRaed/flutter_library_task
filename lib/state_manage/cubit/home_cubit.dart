import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_library_task/models/tag_model/tag_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
