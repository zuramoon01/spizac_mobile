import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:spizac/variables/constants.dart';

class PengaturanTentang extends StatelessWidget {
  const PengaturanTentang({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: pushAppBar('Tentang Aplikasi'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: screenHeight - (12 * 2) - 58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo_x186.png'),
                const SizedBox(height: 48),
                Text(
                  'SPIZAC',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Plaster',
                    color: primaryColor,
                    fontSize: 48,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Versi 1.0',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Copyright 2022 Spizac, Inc. All rights Reserved.',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: HexColor('#808080'),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Powered by Geli, Rizki, Pieter and MotionX-Activity Engine version 1.0 b. 136473:13454M Indonesia and Foreign patents granted and pending. Copyright 2021-202 Fullpower Technologies, Inc. All rights reserved.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: HexColor('#BFBFBF'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
