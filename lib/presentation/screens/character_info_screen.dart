import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/bloc/get_characters_bloc.dart';

class CharacterInfoScreen extends StatefulWidget {
  final String url;
  const CharacterInfoScreen({super.key, required this.url});

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetCharactersBloc, GetCharactersState>(
        builder: (context, state) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
