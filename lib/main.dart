import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/data/dio_settings/dio_settings.dart';
import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';
import 'package:neobis_week_five_projekt/internal/app.dart';
import 'package:get_it/get_it.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<DioSettings>(DioSettings());
  getIt.registerSingleton<GetCaractersRepository>(
    GetCaractersRepository(dio: getIt<DioSettings>().dio),
  );
}
