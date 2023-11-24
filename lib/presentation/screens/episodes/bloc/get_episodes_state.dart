part of 'get_episodes_bloc.dart';

@immutable
sealed class GetEpisodesState {}

final class GetEpisodesInitial extends GetEpisodesState {}

final class GetEpisodesLoading extends GetEpisodesState {}

final class GetEpisodesLoaded extends GetEpisodesState {
  final ApiEpisodesDetail model;

  GetEpisodesLoaded({required this.model});
}

final class GetEpisodesError extends GetEpisodesState {
  final String errorText;

  GetEpisodesError({required this.errorText});
}
