import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/laporan.dart';
import 'package:spizac/screens/laporan/kalender.dart';
import 'package:spizac/screens/laporan/lari.dart';
import 'package:spizac/screens/laporan/makan.dart';
import 'package:spizac/screens/laporan/minum.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/widgets/laporan/kalender_kecil.dart';

class Laporan extends StatelessWidget {
  const Laporan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LaporanProvider laporanProvider =
        Provider.of<LaporanProvider>(context);

    List<dynamic> dataLaporan = [
      {
        'screen': const Kalender(),
        'rotate': 1,
        'icon': Icons.fitness_center_rounded,
        'nama': 'Latihan',
        'keterangan':
            '${laporanProvider.panjangDataListLatihanYangSudahDikerjakan}x / Hari ini',
      },
      {
        'screen': const Lari(
          judul: 'Lari',
          keterangan:
              'Kamu telah berlari sejauh 250 meter, tersisa 750 meter untuk mencapai targetmu.',
        ),
        'rotate': 0,
        'icon': Icons.directions_run_rounded,
        'nama': 'Lari',
        'keterangan': '300 Meter',
      },
      {
        'screen': const Makan(
          judul: 'Makan',
        ),
        'rotate': 0,
        'icon': Icons.restaurant_menu_rounded,
        'nama': 'Makan',
        'keterangan': '200 Kalori',
      },
      {
        'screen': const Minum(
          judul: 'Minum',
          keterangan: 'Hari Ini\n1 dari 8 Air Minum\nSudah Diminum',
        ),
        'rotate': 0,
        'icon': Icons.water_drop_rounded,
        'nama': 'Minum',
        'keterangan': '625 ml',
      },
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            const KalenderKecil(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < dataLaporan.length; i++) ...{
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => dataLaporan[i]['screen']),
                            ),
                          );
                        },
                        contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        tileColor: Colors.white,
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: (i == 1)
                                ? redColor
                                : (i == 2)
                                    ? yellowColor
                                    : (i == 3)
                                        ? blueColor
                                        : primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: RotatedBox(
                            quarterTurns: dataLaporan[i]['rotate'],
                            child: Icon(
                              dataLaporan[i]['icon'],
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        title: Text(
                          dataLaporan[i]['nama'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          dataLaporan[i]['keterangan'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      if (i < dataLaporan.length - 1)
                        const SizedBox(
                          height: 12,
                        ),
                    },
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
