part of 'tags_cubit.dart';

abstract class TagsState extends Equatable {
  const TagsState();

  @override
  List<Object> get props => [];
}

class TagsInitial extends TagsState {}

class HomeTagSuccess extends TagsState {
  final List<TagModel> data;
  const HomeTagSuccess({
    required this.data,
  });
}

class HomeTagLoading extends TagsState {}

class HomeTagField extends TagsState {
  final String errMasege;
  const HomeTagField({
    required this.errMasege,
  });
}
