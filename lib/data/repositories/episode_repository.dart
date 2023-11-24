import 'package:dio/dio.dart';
import 'package:neobis_week_five_projekt/data/api/api_episodes_detail.dart';

class GetEpisodesRepository {
  final Dio dio;

  GetEpisodesRepository({required this.dio});

  Future<ApiEpisodesDetail> getEpisodesDetail({required String url}) async {
    final responce = await dio.get(url);
    return ApiEpisodesDetail();
  }
}
