import 'package:dio/dio.dart';

import 'package:neobis_week_five_projekt/data/api/api_characters.dart';
import 'package:neobis_week_five_projekt/data/api/api_characters_info.dart';
import 'package:neobis_week_five_projekt/domain/repositories/characters_repository.dart';

class GetCaractersRepository implements GetCharacters {
  final Dio dio;

  GetCaractersRepository({required this.dio});

  @override
  Future getMoreCharacters(int pageCounter) async {
    String url =
        'https://rickandmortyapi.com/api/character?page=$pageCounter&name=';
    final response = await dio.get(url);
    return ApiCharacters.fromApi(response.data);
  }

  @override
  Future getCharacters(String name) async {
    String url = 'https://rickandmortyapi.com/api/character?page=&name=$name';

    final response = await dio.get(url);
    return ApiCharacters.fromApi(response.data);
  }

  @override
  Future getCharactersInfo(String url) async {
    final responce = await dio.get(url);
    return ApiCharactersDetail.fromJson(responce.data);
  }
}
