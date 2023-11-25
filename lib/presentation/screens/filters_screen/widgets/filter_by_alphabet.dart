import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class FilterByAlphabet extends StatelessWidget {
  const FilterByAlphabet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'По алфавиту',
          style: AppFonts.s16w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
