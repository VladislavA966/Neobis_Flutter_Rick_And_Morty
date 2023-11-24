import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class NameStatusColumn extends StatelessWidget {
  final String name;
  final String status;

  const NameStatusColumn({
    super.key,
    required this.name,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            name,
            style: AppFonts.s34w400.copyWith(color: AppColors.white),
          ),
          Text(
            status,
            style: AppFonts.s10w500.copyWith(
              color: AppColors.green,
            ),
          ),
        ],
      ),
    );
  }
}