import 'package:flutter/material.dart';

class BackgroundCharacterImage extends StatelessWidget {
  final String image;
  const BackgroundCharacterImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.grey.withOpacity(0.65),
          BlendMode.srcATop,
        ),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}