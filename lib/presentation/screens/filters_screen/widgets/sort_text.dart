import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class SortText extends StatelessWidget {
  const SortText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'СОРТИРОВАТЬ',
      style: AppFonts.s10w500.copyWith(
        color: AppColors.grey,
      ),
    );
  }
}