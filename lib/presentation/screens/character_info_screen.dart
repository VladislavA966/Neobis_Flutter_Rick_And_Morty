import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neobis_week_five_projekt/presentation/screens/characters_list/bloc/get_characters_bloc.dart';

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
                    SizedBox(
                      height: 36,
                    ),
                    LineContainer(),
                    SizedBox(
                      height: 26,
                    ),
                    Padding(
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

class NameStatusColumn extends StatelessWidget {
  final String name;
  final String status;

  const NameStatusColumn({
    super.key,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            name,
            style: AppFonts.s34w400.copyWith(color: AppColors.white),
          ),
          Text(
            status,
            style: AppFonts.s10w500.copyWith(
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundCharacterImage extends StatelessWidget {
  final String image;
  const BackgroundCharacterImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.grey.withOpacity(0.65),
          BlendMode.srcATop,
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

class EpisodesTitleRow extends StatelessWidget {
  const EpisodesTitleRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
      ],
    );
  }
}

class EpisodesInfoColumn extends StatelessWidget {
  const EpisodesInfoColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
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
            style: AppFonts.s14w500.copyWith(color: AppColors.textFieldIcon),
          ),
        ],
      ),
    );
  }
}

class LineContainer extends StatelessWidget {
  const LineContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFF152A3A),
          ),
        ),
      ),
    );
  }
}

class CharacterInfoRow extends StatelessWidget {
  final String gender;
  final String birthDayPlace;
  final String location;
  final String type;
  const CharacterInfoRow({
    super.key,
    required this.gender,
    required this.birthDayPlace,
    required this.location,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Пол',
                style:
                    AppFonts.s12w400.copyWith(color: AppColors.textFieldIcon),
              ),
              Text(
                'Мужской',
                style: AppFonts.s14w500.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Место рождения',
                style:
                    AppFonts.s12w400.copyWith(color: AppColors.textFieldIcon),
              ),
              Text(
                'Земля С - 137',
                style: AppFonts.s14w500.copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Местоположение',
                style:
                    AppFonts.s12w400.copyWith(color: AppColors.textFieldIcon),
              ),
              Text(
                'Земля(Измерение подмены)',
                style: AppFonts.s14w500.copyWith(color: AppColors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Расса',
                style:
                    AppFonts.s12w400.copyWith(color: AppColors.textFieldIcon),
              ),
              Text(
                'Человек',
                style: AppFonts.s14w500.copyWith(color: AppColors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.height * 0.15,
      top: MediaQuery.of(context).size.height * 0.20,
      child: CircleAvatar(
        radius: 81,
        backgroundColor: AppColors.darkBlue,
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 73,
        ),
      ),
    );
  }
}
