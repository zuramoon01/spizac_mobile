import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/widgets/laporan/kalender_kecil.dart';
import 'package:spizac/widgets/laporan/keterangan_laporan.dart';

Scaffold templateLaporan(
  String judul,
  String keterangan,
  Widget widgetTambahanTengah,
  Widget widgetTambahanBawah,
) {
  return Scaffold(
    appBar: pushAppBar(judul),
    backgroundColor: backgroundColor,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const KalenderKecil(),
            KeteranganLaporan(
              judul: judul,
              keterangan: keterangan,
              widgetTambahanTengah: widgetTambahanTengah,
              widgetTambahanBawah: widgetTambahanBawah,
            ),
          ],
        ),
      ),
    ),
  );
}
