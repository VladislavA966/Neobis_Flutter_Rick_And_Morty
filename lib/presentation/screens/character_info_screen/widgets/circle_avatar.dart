import 'package:flutter/material.dart';
import 'package:neobis_week_five_projekt/resources/app_colors/app_colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String image;
  const CustomCircleAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.height * 0.15,
      top: MediaQuery.of(context).size.height * 0.20,
      child: CircleAvatar(
        radius: 81,
        backgroundColor: AppColors.darkBlue,
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: 73,
        ),
      ),
    );
  }
}
