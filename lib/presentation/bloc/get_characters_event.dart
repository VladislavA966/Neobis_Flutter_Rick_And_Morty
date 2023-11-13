part of 'get_characters_bloc.dart';

@immutable
sealed class GetCharacters {}

class GetCharactersEvent extends GetCharacters {
  final String? name;
  GetCharactersEvent({this.name});
}
