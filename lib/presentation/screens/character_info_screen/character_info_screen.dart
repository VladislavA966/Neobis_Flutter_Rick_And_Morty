import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/bg_image.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/characters_widget.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/circle_avatar.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/line_container.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/name_status_column.dart';
import 'package:neobis_week_five_projekt/presentation/screens/characters_list/bloc/get_characters_bloc.dart';

import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/filters_screen.dart';

import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class CharacterInfoScreen extends StatefulWidget {
  final String url;
  const CharacterInfoScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  @override
  void initState() {
    BlocProvider.of<GetCharactersBloc>(context).add(
      GetCharacterInfoEvent(url: widget.url),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCharactersBloc, GetCharactersState>(
      builder: (context, state) {
        if (state is GetCharacterInfoSuccsess) {
          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    BackgroundCharacterImage(
                      image: state.model.image ?? '',
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    NameStatusColumn(
                        name: state.model.name ?? '',
                        status: state.model.status ?? ''),
                    CharacterInfoRow(
                        gender: state.model.gender ?? ' ',
                        birthDayPlace: state.model.origin!.name ?? '',
                        location: state.model.location!.name ?? '',
                        type: state.model.species ?? ''),
                    const SizedBox(
                      height: 36,
                    ),
                    const LineContainer(),
                    const SizedBox(
                      height: 26,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: EpisodesTitleRow(),
                    ),
                  ],
                ),
                CustomCircleAvatar(
                  image: state.model.image ?? '',
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class EpisodesTitleRow extends StatelessWidget {
  const EpisodesTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Эпизоды',
                style: AppFonts.s20w500.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const EpisodesInfoColumn(),
            ],
          ),
        ),
      ],
    );
  }
}

class EpisodesInfoColumn extends StatelessWidget {
  const EpisodesInfoColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Серия 1',
              style: AppFonts.s10w500.copyWith(
                color: AppColors.lightBlue,
              ),
            ),
            Text(
              'Пилот',
              style: AppFonts.s16w500.copyWith(
                color: AppColors.white,
              ),
            ),
            Text(
              '2 декабря 2013',
              style: AppFonts.s14w500.copyWith(
                color: AppColors.textFieldIcon,
              ),
            ),
          ],
        );
      },
    );
  }
}
