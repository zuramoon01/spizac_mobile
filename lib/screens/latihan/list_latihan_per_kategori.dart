import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/laporan.dart';
import 'package:spizac/variables/constants.dart';

class ListLatihanPerKategori extends StatelessWidget {
  final String judul;
  final String waktu;
  final List<dynamic> dataLatihan;

  const ListLatihanPerKategori({
    Key? key,
    required this.judul,
    required this.waktu,
    required this.dataLatihan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final LaporanProvider laporanProvider =
        Provider.of<LaporanProvider>(context);

    return Scaffold(
      appBar: pushAppBar(judul),
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 84),
            itemCount: dataLatihan.length,
            itemBuilder: ((context, index) {
              return Container(
                margin: EdgeInsets.fromLTRB(
                  12,
                  (index == 0) ? 12 : 4,
                  12,
                  (index == dataLatihan.length - 1) ? 12 : 4,
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  tileColor: Colors.white,
                  leading: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.fitness_center,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    dataLatihan[index]['nama'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                    dataLatihan[index]['waktu'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              padding: const EdgeInsets.fromLTRB(36, 12, 36, 12),
              width: screenWidth,
              color: Colors.white,
              child: ElevatedButton(
                onPressed: () {
                  laporanProvider.dataListLatihanYangSudahDikerjakan = [
                    {
                      'tanggal': DateFormat('d MMMM y', 'id')
                          .format(DateTime.now())
                          .toString(),
                      'data': [
                        {
                          'nama': judul,
                          'waktu': '$waktu Menit',
                          'kalori': const [true, false, false],
                        },
                      ],
                    },
                  ];

                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(240, 48),
                  primary: primaryColor,
                ),
                child: const Text(
                  'Mulai Latihan',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
