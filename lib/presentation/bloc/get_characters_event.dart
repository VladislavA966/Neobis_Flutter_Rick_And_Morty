part of 'get_characters_bloc.dart';

@immutable
sealed class GetCharacters {}

class GetCharactersEvent extends GetCharacters {
  final String? name;
  final int? counter;
  GetCharactersEvent({this.name, this.counter});
}

class GetCharacterInfoEvent extends GetCharacters {
  final String url;
 

  GetCharacterInfoEvent({required this.url});
}
