import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/app.dart';
import 'package:spizac/providers/laporan.dart';
import 'package:spizac/providers/pendaftaran.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/screens/home.dart';

void main() {
  initializeDateFormatting('id', null).then(
    (_) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AppProvider>(
            create: (context) => AppProvider(),
          ),
          ChangeNotifierProvider<PendaftaranProvider>(
            create: (context) => PendaftaranProvider(),
          ),
          ChangeNotifierProvider<LaporanProvider>(
            create: (context) => LaporanProvider(),
          ),
          ChangeNotifierProvider<ProfilProvider>(
            create: (context) => ProfilProvider(),
          ),
        ],
        child: const Spizac(),
      ),
    ),
  );
}

class Spizac extends StatelessWidget {
  const Spizac({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Spizac',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
