import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

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