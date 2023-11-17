import 'dart:math';

import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class CharactersRow extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  Function() onTap;
  CharactersRow(
      {super.key,
      required this.image,
      required this.name,
      required this.status,
      required this.species,
      required this.gender,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(image),
            ),
            const SizedBox(
              width: 18,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    status,
                    style: AppFonts.s10w500.copyWith(
                      color: status == 'Alive' ? AppColors.green : AppColors.red,
                    ),
                  ),
                  Text(
                    name,
                    
                    style: AppFonts.s16w500.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    '$species , $gender',
                    style: AppFonts.s12w400.copyWith(color: AppColors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
