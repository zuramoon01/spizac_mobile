import 'package:flutter/material.dart';
import 'package:spizac/variables/laporan.dart';
import 'package:spizac/widgets/laporan/tambahan_widget_minum_bawah.dart';
import 'package:spizac/widgets/laporan/tambahan_widget_minum_tengah.dart';

class Minum extends StatelessWidget {
  final String judul;
  final String keterangan;

  const Minum({
    Key? key,
    required this.judul,
    required this.keterangan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> dataLaporanMinum = [
      {
        'nama': '1 Gelas',
        'keterangan': 'Yang Diminum',
      },
      {
        'nama': '750 ml',
        'keterangan': 'Per Gelas',
      },
      {
        'nama': '8 Gelas',
        'keterangan': 'Target Harian',
      },
    ];

    return templateLaporan(
      judul,
      keterangan,
      const TambahanWidgetMinumTengah(),
      TambahanWidgetMinumBawah(dataLaporanMinum: dataLaporanMinum),
    );
  }
}
