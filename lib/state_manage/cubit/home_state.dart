// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeTagSuccess extends HomeState {
  final List<TagModel> data;
  HomeTagSuccess({
    required this.data,
  });
}

class HomeTagLoading extends HomeState {}

class HomeTagField extends HomeState {}

class HomeLibarySuccess extends HomeState {}

class HomeLibaryLoading extends HomeState {}

class HomeLibaryField extends HomeState {}
