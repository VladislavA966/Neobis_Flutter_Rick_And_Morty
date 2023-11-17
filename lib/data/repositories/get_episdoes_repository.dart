import 'package:dio/dio.dart';
import 'package:neobis_week_five_projekt/data/models/epidoses_model.dart';

class GetEpisodesRepository {
  final Dio dio;

  GetEpisodesRepository({required this.dio});

  Future<EpisodesModel> getEpisodesList({
    required String url,
  }) async {
    final Response response = await dio.get(url);
    return EpisodesModel.fromJson(response.data);
  }
}
