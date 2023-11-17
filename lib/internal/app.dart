import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_week_five_projekt/data/dio_settings/dio_settings.dart';
import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';
import 'package:neobis_week_five_projekt/presentation/bloc/get_characters_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list_page.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBgDark,
        unselectedWidgetColor: AppColors.textFieldIcon,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => DioSettings(),
          ),
          RepositoryProvider(
            create: (context) => GetCaractersRepository(
                dio: RepositoryProvider.of<DioSettings>(context).dio),
          ),
        ],
        child: BlocProvider(
          create: (context) => GetCharactersBloc(
            repository: RepositoryProvider.of<GetCaractersRepository>(context),
          ),
          child: const FiltersScreen(),
        ),
      ),
    );
  }
}
