import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? checkboxValue1 = true;
  bool checkboxValue2 = true;
  bool checkboxValue3 = true;
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
              SizedBox(height: 10,),
              checkBox(title: 'Живой'),
              checkBox(title: 'Мертвый'),
              checkBox(title: 'Неизвестно'),
              const SizedBox(height: 36,),
              const LineContainer(),
              const SizedBox(height: 36,),
              Text('ПОЛ', style: AppFonts.s10w500.copyWith(color: AppColors.textFieldIcon),),
              SizedBox(height: 10,),
              checkBox(title: 'Мужской'),
              checkBox(title: 'Женский'),
              checkBox(title: 'Бесполый'),
            ],
          ),
        ),
      ),
    );
  }

  Row checkBox({required String title}) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.lightBlue,
          value: checkboxValue1,
          onChanged: (bool? value) {
            setState(() {
              checkboxValue1 = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
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
