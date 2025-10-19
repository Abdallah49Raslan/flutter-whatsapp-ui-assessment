part of 'stories_cubit.dart';

sealed class StoriesState extends Equatable {
  const StoriesState();

  @override
  List<Object> get props => [];
}

final class StoriesInitial extends StoriesState {}
