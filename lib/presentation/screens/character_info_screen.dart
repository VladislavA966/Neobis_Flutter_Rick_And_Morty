import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_week_five_projekt/data/dio_settings/dio_settings.dart';
import 'package:neobis_week_five_projekt/data/repositories/get_characters_repository.dart';
import 'package:neobis_week_five_projekt/presentation/bloc/get_characters_bloc.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class CharacterInfoScreen extends StatefulWidget {
  final String url;

  const CharacterInfoScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<CharacterInfoScreen> createState() => _CharacterInfoScreenState();
}

class _CharacterInfoScreenState extends State<CharacterInfoScreen> {
  final bloc = GetCharactersBloc(
    repository: GetCaractersRepository(dio: DioSettings().dio),
  ); //У меня где то теряется context, когда начинаю работать с bloc красный экран с ошибкой контекста. Думал, что такой способ поможет, но когда начинаю работать с BlocBuilder ошибка вернулась.

  @override
  void initState() {
    bloc.add(
      GetCharacterInfoEvent(url: widget.url),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const BackgroundCharacterImage(),
              const SizedBox(
                height: 90,
              ),
              const NameStatusColumn(),
              Text(
                'Живой',
                style: AppFonts.s10w500.copyWith(
                  color: AppColors.green,
                ),
              ),
              const CharacterInfoRow(),
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
          const CustomCircleAvatar(),
        ],
      ),
    );
  }
}

class NameStatusColumn extends StatelessWidget {
  const NameStatusColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        'Рик Санчез',
        style: AppFonts.s34w400.copyWith(color: AppColors.white),
      ),
    );
  }
}

class BackgroundCharacterImage extends StatelessWidget {
  const BackgroundCharacterImage({
    super.key,
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
          'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
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
  const CharacterInfoRow({
    super.key,
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
  const CustomCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.height * 0.15,
      top: MediaQuery.of(context).size.height * 0.20,
      child: const CircleAvatar(
        radius: 81,
        backgroundColor: AppColors.darkBlue,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
          radius: 73,
        ),
      ),
    );
  }
}
