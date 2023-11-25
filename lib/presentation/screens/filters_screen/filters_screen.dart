import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/presentation/screens/character_info_screen/widgets/line_container.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/widgets/filter_by_alphabet.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/widgets/gendet_text.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/widgets/sort_text.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/widgets/status_text.dart';
import 'package:neobis_week_five_projekt/presentation/screens/filters_screen/widgets/title_bar.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? aliveCheck = false;
  bool? deadCheck = false;
  bool? unknownCheck = false;
  bool? maleChek = false;
  bool? femaleCheck = false;
  bool? unknownGender = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWidget(),
              const SizedBox(
                height: 24,
              ),
              const SortText(),
              const SizedBox(
                height: 29,
              ),
              const FilterByAlphabet(),
              const SizedBox(
                height: 41,
              ),
              const LineContainer(),
              const SizedBox(
                height: 36,
              ),
              const StatusText(),
              const SizedBox(
                height: 10,
              ),
              _aliveCheck(),
              _deadCheck(),
              _unknownCheck(),
              const SizedBox(
                height: 36,
              ),
              const LineContainer(),
              const SizedBox(
                height: 36,
              ),
              const GenderText(),
              const SizedBox(
                height: 10,
              ),
              _maleCheck(),
              _femaleCheck(),
              _unknownGenderCheck(),
            ],
          ),
        ),
      ),
    );
  }

  Row _unknownGenderCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: unknownGender,
          onChanged: (bool? value) {
            setState(() {
              unknownGender = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Бесполый',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _femaleCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: femaleCheck,
          onChanged: (bool? value) {
            setState(() {
              femaleCheck = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Женский',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _maleCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: maleChek,
          onChanged: (bool? value) {
            setState(() {
              maleChek = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Мужской',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _unknownCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: unknownCheck,
          onChanged: (bool? value) {
            setState(() {
              unknownCheck = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Неизвестно',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _deadCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: deadCheck,
          onChanged: (bool? value) {
            setState(() {
              deadCheck = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Мертвый',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Row _aliveCheck() {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: aliveCheck,
          onChanged: (bool? value) {
            setState(() {
              aliveCheck = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Живой',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
