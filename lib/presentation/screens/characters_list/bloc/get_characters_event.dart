part of 'get_characters_bloc.dart';

@immutable
sealed class GetCharacters {}

class GetCharactersEvent extends GetCharacters {
  final String? name;

  GetCharactersEvent({
    this.name,
  });
}

class GetMoreCharacters extends GetCharacters {
  final String counter;

  GetMoreCharacters(this.counter);
}

class GetCharacterInfoEvent extends GetCharacters {
  final String url;

  GetCharacterInfoEvent({required this.url});
}
