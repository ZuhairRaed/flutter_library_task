// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLibarySuccess extends HomeState {
  final List<LibraryModel> data;
  const HomeLibarySuccess({
    required this.data,
  });
}

class HomeLibaryLoading extends HomeState {}

class HomeLibaryField extends HomeState {
  final String errMasege;
  HomeLibaryField({
    required this.errMasege,
  });
}
