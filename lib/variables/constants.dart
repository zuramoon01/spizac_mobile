import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color primaryColor = HexColor('#1E6C60');

final Color grayColor = HexColor('#C4C4C4');
final Color yellowColor = HexColor('#FCF09C');
final Color redColor = HexColor('#E44848');
final Color blueColor = HexColor('#1E5478');

final Color backgroundColor = HexColor('#F4F8F7');

AppBar pushAppBar(String judul) {
  return AppBar(
    title: Text(
      judul,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    backgroundColor: primaryColor,
  );
}
