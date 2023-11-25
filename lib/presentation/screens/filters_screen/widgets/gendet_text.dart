import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class GenderText extends StatelessWidget {
  const GenderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'ПОЛ',
      style: AppFonts.s10w500.copyWith(color: AppColors.textFieldIcon),
    );
  }
}