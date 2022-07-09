import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/widgets/laporan/kalender_kecil.dart';

class Makan extends StatelessWidget {
  final String judul;

  const Makan({
    Key? key,
    required this.judul,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double containerHeight = screenWidth - 36;

    List<dynamic> dataMakanan = [
      {
        'image': 'assets/images/dada_ayam.jpg',
        'nama': 'Dada Ayam',
        'keterangan': 'Protein',
      },
      {
        'image': 'assets/images/sayuran.jpg',
        'nama': 'Sayuran Berdaun Hijau',
        'keterangan': 'Kalsium',
      },
      {
        'image': 'assets/images/pisang.jpg',
        'nama': 'Pisang',
        'keterangan': 'Vitamin',
      },
      {
        'image': 'assets/images/susu.jpg',
        'nama': 'Susu',
        'keterangan': 'Tambahan',
      },
    ];

    return Scaffold(
      appBar: pushAppBar(judul),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              const KalenderKecil(),
              Container(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 425,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    judul,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                height: 501,
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 425,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1 / 1.25,
                  children: <Widget>[
                    for (dynamic data in dataMakanan) ...{
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          clipBehavior: Clip.hardEdge,
                          children: <Widget>[
                            SizedBox(
                              height: containerHeight,
                              child: Image.asset(
                                data['image'],
                                repeat: ImageRepeat.noRepeat,
                                height: containerHeight,
                                fit: BoxFit.fitHeight,
                                alignment: const Alignment(0.7, 0),
                              ),
                            ),
                            Container(
                              height: containerHeight,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: <Color>[
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.35),
                                    Colors.black.withOpacity(0.05),
                                    Colors.black.withOpacity(0.05),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 12,
                              left: 12,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: ((screenWidth - 24) / 2) - 24,
                                    child: Text(
                                      data['nama'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ((screenWidth - 24) / 2) - 24,
                                    child: Text(
                                      data['keterangan'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
