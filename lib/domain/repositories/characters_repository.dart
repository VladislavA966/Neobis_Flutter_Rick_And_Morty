abstract class GetCharacters {
  Future<dynamic> getCharacters(String name);
  Future<dynamic> getMoreCharacters(int pageCounter);
  Future<dynamic> getCharactersInfo(String url);
}
