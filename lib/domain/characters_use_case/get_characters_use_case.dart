import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';
import 'package:neobis_week_five_projekt/domain/model/characters_model.dart';

class GetCharactersUseCase {
  final GetCaractersRepository charactersRepository;

  GetCharactersUseCase({required this.charactersRepository});

  Future<CharacterList> getCharacters(String name) async {
    return await charactersRepository.getCharacters(name);
  }

  Future<CharacterList> getMoreCharacters(int pageCounter) async {
    return await charactersRepository.getMoreCharacters(pageCounter);
  }
}
