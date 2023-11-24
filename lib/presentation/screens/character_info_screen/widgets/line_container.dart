import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFF152A3A),
          ),
        ),
      ),
    );
  }
}