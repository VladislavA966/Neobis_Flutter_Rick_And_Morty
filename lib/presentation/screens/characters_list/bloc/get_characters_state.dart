part of 'get_characters_bloc.dart';

@immutable
sealed class GetCharactersState {}

final class GetCharactersInitial extends GetCharactersState {}

final class GetCharactersLoading extends GetCharactersState {}

final class GetCharactersSuccses extends GetCharactersState {
  final ApiCharacters model;

  GetCharactersSuccses({required this.model});
}

final class GetCharactersError extends GetCharactersState {
  final String errorText;

  GetCharactersError({required this.errorText});
}

final class GetCharacterInfoSuccsess extends GetCharactersState {
  final ApiCharactersDetail model;
  GetCharacterInfoSuccsess({required this.model});
}
