import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/app.dart';
import 'package:spizac/providers/pendaftaran.dart';
import 'package:spizac/screens/laporan/laporan.dart';
import 'package:spizac/screens/latihan/latihan.dart';
import 'package:spizac/screens/opening.dart';
import 'package:spizac/screens/pendaftaran/pendaftaran.dart';
import 'package:spizac/screens/profil/profil.dart';
import 'package:spizac/variables/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PendaftaranProvider pendaftaranProvider =
        Provider.of<PendaftaranProvider>(context);
    final AppProvider appProvider = Provider.of<AppProvider>(context);

    List<dynamic> titleScreens = [
      'Latihan untuk anda',
      'Laporan',
      'Profil',
    ];

    List<dynamic> screens = [
      const Opening(),
      const Pendaftaran(),
      const Latihan(),
      const Laporan(),
      const Profil(),
    ];

    Timer.periodic(const Duration(seconds: 3), (timer) {
      (appProvider.indexScreen < 1)
          ? appProvider.indexScreen += 1
          : timer.cancel();
    });

    return Scaffold(
      appBar: (appProvider.indexScreen == 0 || appProvider.indexScreen == 1)
          ? null
          : appBar(titleScreens[appProvider.halaman]),
      backgroundColor: backgroundColor,
      body: WillPopScope(
        onWillPop: () async {
          if (pendaftaranProvider.indexScreen > 0 &&
              pendaftaranProvider.indexScreen < 3) {
            pendaftaranProvider.indexScreen -= 1;
            return false;
          }

          if (pendaftaranProvider.indexScreen == 3 &&
              appProvider.indexScreen > 2) {
            appProvider.halaman = 0;
            return false;
          }

          return await showDialog<dynamic>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Keluar dari aplikasi SPIZAC?'),
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text(
                      'Kembali',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                    child: const Text(
                      'Keluar',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: screens[appProvider.indexScreen],
      ),
      bottomNavigationBar:
          (appProvider.indexScreen == 0 || appProvider.indexScreen == 1)
              ? null
              : bottomBar(appProvider),
    );
  }

  AppBar appBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      foregroundColor: Colors.black,
    );
  }

  BottomNavigationBar bottomBar(AppProvider appProvider) {
    List<dynamic> dataNavigationBottomBarItem = const [
      {
        'icon': Icon(Icons.fitness_center),
        'label': 'Latihan',
      },
      {
        'icon': Icon(Icons.equalizer),
        'label': 'Laporan',
      },
      {
        'icon': Icon(Icons.person),
        'label': 'Profil',
      },
    ];

    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconSize: 24,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(color: primaryColor, size: 26),
      showUnselectedLabels: false,
      unselectedIconTheme:
          IconThemeData(color: Colors.black.withOpacity(0.25), size: 24),
      currentIndex: appProvider.halaman,
      onTap: (index) {
        appProvider.halaman = index;
      },
      items: <BottomNavigationBarItem>[
        for (var data in dataNavigationBottomBarItem)
          BottomNavigationBarItem(
            icon: (data['label'] == 'Latihan')
                ? RotatedBox(quarterTurns: 1, child: data['icon'])
                : data['icon'],
            label: data['label'],
          ),
      ],
    );
  }
}
