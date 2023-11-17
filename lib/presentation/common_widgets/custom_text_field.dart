import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';
import 'package:neobis_week_five_projekt/resources/resources.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          minWidth: 24,
        ),
        filled: true,
        fillColor: AppColors.darkBlue,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: AppColors.textFieldIcon,
        hintText: 'Найти персонажа',
        hintStyle: AppFonts.s16w400.copyWith(
          color: AppColors.textFieldIcon,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: SvgPicture.asset(
            AppImages.filterSort,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
    );
  }
}
