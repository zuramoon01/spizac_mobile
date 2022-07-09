import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/variables/laporan.dart';
import 'package:spizac/widgets/laporan/tambahan_widget_lari_bawah.dart';
import 'package:spizac/widgets/laporan/tambahan_widget_lari_tengah.dart';

class Lari extends StatelessWidget {
  final String judul;
  final String keterangan;

  const Lari({
    Key? key,
    required this.judul,
    required this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> dataLingkaranLari = [
      {
        'icon': Icons.local_fire_department,
        'color': blueColor,
        'backgroundColor': blueColor.withOpacity(0.4),
        'nama': '50 Kalori',
      },
      {
        'icon': Icons.map,
        'color': yellowColor,
        'backgroundColor': yellowColor.withOpacity(0.4),
        'nama': '1/4 Km',
      },
      {
        'icon': Icons.timer,
        'color': redColor,
        'backgroundColor': redColor.withOpacity(0.4),
        'nama': '25 Menit',
      },
    ];

    return templateLaporan(
      judul,
      keterangan,
      const TambahanWidgetLariTengah(),
      TambahanWidgetLariBawah(
        dataLingkaranLari: dataLingkaranLari,
      ),
    );
  }
}
