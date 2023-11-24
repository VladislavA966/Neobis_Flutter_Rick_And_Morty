import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

//not refactored
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
              Container(
                height: 52,
                width: double.infinity,
                color: AppColors.darkBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Фильтры',
                        style: AppFonts.s20w500.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'СОРТИРОВАТЬ',
                style: AppFonts.s10w500.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Row(
                children: [
                  Text(
                    'По алфавиту',
                    style: AppFonts.s16w400.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 41,
              ),
              const LineContainer(),
              const SizedBox(
                height: 36,
              ),
              Text(
                'СТАТУС',
                style: AppFonts.s10w500.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
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
              ),
              Row(
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
              ),
              Row(
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
              ),
              const SizedBox(
                height: 36,
              ),
              const LineContainer(),
              const SizedBox(
                height: 36,
              ),
              Text(
                'ПОЛ',
                style:
                    AppFonts.s10w500.copyWith(color: AppColors.textFieldIcon),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
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
              ),
              Row(
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
              ),
              Row(
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
              ),
            ],
          ),
        ),
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
            color: AppColors.darkBlue,
          ),
        ),
      ),
    );
  }
}
