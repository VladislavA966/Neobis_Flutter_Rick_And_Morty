import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';
import 'package:neobis_week_five_projekt/main.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list/bloc/get_characters_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list/characters_list_page.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCharactersBloc(
        repository: getIt<GetCaractersRepository>(),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBgDark,
          unselectedWidgetColor: AppColors.textFieldIcon,
        ),
        home: const CharactersListPage(),
      ),
    );
  }
}
