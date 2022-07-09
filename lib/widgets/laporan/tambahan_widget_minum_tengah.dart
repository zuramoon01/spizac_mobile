import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';

class TambahanWidgetMinumTengah extends StatelessWidget {
  const TambahanWidgetMinumTengah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: blueColor,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.water_drop_rounded,
        size: 160,
        color: Colors.white,
      ),
    );
  }
}
