import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.errorOne,
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          'Персонажа с таким именем\nне найден',
          textAlign: TextAlign.center,
          style: AppFonts.s16w400.copyWith(color: AppColors.textFieldIcon),
        ),
      ],
    );
  }
}
