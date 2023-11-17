import 'package:dio/dio.dart';
import 'package:neobis_week_five_projekt/data/models/character_info_model.dart';
import 'package:neobis_week_five_projekt/data/models/characters_list_model.dart';

class GetCaractersRepository {
  final Dio dio;

  GetCaractersRepository({required this.dio});

  Future<CaractersModel> getCaracters(
      {int counter = 1, String name = ''}) async {
    String url =
        'https://rickandmortyapi.com/api/character?page=$counter&name=$name';

    final Response response = await dio.get(url);
    return CaractersModel.fromJson(response.data);
  }

  Future<CharacterInfoModel> getInfoCharacter({required String url}) async {
    final Response response = await dio.get(url);
    return CharacterInfoModel.fromJson(response.data);
  }
}
