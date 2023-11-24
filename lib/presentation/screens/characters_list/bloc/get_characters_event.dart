part of 'get_characters_bloc.dart';

@immutable
sealed class GetCharacters {}

class GetCharactersEvent extends GetCharacters {
  final String? name;

  GetCharactersEvent({
    this.name,
  });
}

class GetMoreCharactersEvent extends GetCharacters {
  final String counter;

  GetMoreCharactersEvent({required this.counter});
}

class GetCharacterInfoEvent extends GetCharacters {
  final String url;

  GetCharacterInfoEvent({required this.url});
}
