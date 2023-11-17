import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';
import 'package:neobis_week_five_projekt/resources/app_fonst/app_fonts.dart';

class CharactersGrid extends StatelessWidget {
  final String image;
  final String name;
  final String status;
  final String species;
  final String gender;
  Function() onTap;
  CharactersGrid(
      {super.key,
      required this.image,
      required this.status,
      required this.name,
      required this.species,
      required this.gender,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: 65,
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            status,
            style: AppFonts.s10w500.copyWith(
              color: status == 'Alive' ? AppColors.green : AppColors.red,
            ),
          ),
          Flexible(
            child: Text(
              name,
              style: AppFonts.s14w500.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
          Text(
            '$species , $gender',
            style: AppFonts.s12w400.copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
