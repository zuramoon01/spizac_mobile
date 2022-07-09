import 'package:flutter/material.dart';
import 'package:spizac/screens/latihan/list_latihan_per_kategori.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/widgets/latihan/favorit_ikon.dart';

class Latihan extends StatelessWidget {
  const Latihan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    List<dynamic> dataKategoriLatihan = [
      {
        'kalori': const [true, false, false],
        'nama': 'Lengan',
        'level': 'Pemula',
        'waktu': '10',
        'favorit': false,
        'latihan': <dynamic>[
          {
            'nama': 'Angkat Tangan Sambil Berdiri',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Angkat Lengan Ke Samping',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Tricip Dip',
            'waktu': 'x 10',
          },
          {
            'nama': 'Putar Lengan Searah Jarum Jam',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Putar Lengan Berlawanan Arah Jarum Jam',
            'waktu': 'x 6',
          },
          {
            'nama': 'Push-up Berlian',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Loncat Bintang',
            'waktu': '00 : 16',
          },
          {
            'nama': 'Tekan Lengan Didepan Dada',
            'waktu': 'x 8',
          },
          {
            'nama': 'Curl Barbel Kaki Kiri',
            'waktu': 'x 8',
          },
          {
            'nama': 'Curl Barbel Kaki Kanan',
            'waktu': 'x ',
          },
          {
            'nama': 'Diagonal Plank',
            'waktu': 'x 10',
          },
          {
            'nama': 'Meninju',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Push-up',
            'waktu': 'x 10',
          },
          {
            'nama': 'Inchworms',
            'waktu': 'x 8',
          },
          {
            'nama': 'Push Up Dinding',
            'waktu': 'x 12',
          },
          {
            'nama': 'Peregangan Trisep Kiri',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Trisep Kanan',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Trisep Berdiri Kiri',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Trisep Berdiri Kanan',
            'waktu': '00 : 30',
          },
        ],
      },
      {
        'kalori': const [true, true, false],
        'nama': 'Bahu & Punggung',
        'level': 'Pemula',
        'waktu': '15',
        'favorit': false,
        'latihan': <dynamic>[
          {
            'nama': 'Loncat Bintang',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Angkat Tangan Sambil Berdiri',
            'waktu': '00 : 16',
          },
          {
            'nama': 'Tarikan Romboid',
            'waktu': 'x 14',
          },
          {
            'nama': 'Angkat Lengan Ke Samping',
            'waktu': '00 : 16',
          },
          {
            'nama': 'Push-up Lutut',
            'waktu': 'x 14',
          },
          {
            'nama': 'Peregangan Lantai Berbaring Miring Kiri',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Lantai Berbaring Miring Kanan',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Gunting Lengan',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Tarikan Romboid',
            'waktu': 'x 12',
          },
          {
            'nama': 'Angkat Lengan Ke Samping',
            'waktu': '00 : 14',
          },
          {
            'nama': 'Push-up Lutut',
            'waktu': 'x 12',
          },
          {
            'nama': 'Sikap Kucing Sapi',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Push-up Tricep Telungkup',
            'waktu': 'x 14',
          },
          {
            'nama': 'Remasan Romboid Duduk',
            'waktu': 'x 12',
          },
          {
            'nama': 'Push-up Tricep Telungkup',
            'waktu': 'x 14',
          },
          {
            'nama': 'Remasan Romboid Duduk',
            'waktu': 'x 12',
          },
          {
            'nama': 'Sikap Anak',
            'waktu': '00 : 30',
          },
        ],
      },
      {
        'kalori': const [true, true, false],
        'nama': 'Dada',
        'level': 'Pemula',
        'waktu': '12',
        'favorit': true,
        'latihan': <dynamic>[
          {
            'nama': 'Loncat Bintang',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Push Up Tangan Di Atas Bangku',
            'waktu': 'x 6',
          },
          {
            'nama': 'Push-up',
            'waktu': 'x 4',
          },
          {
            'nama': 'Push-up Tangan Melebar',
            'waktu': 'x 4',
          },
          {
            'nama': 'Tricip Dip',
            'waktu': 'x 6',
          },
          {
            'nama': 'Push-up Tangan Melebar',
            'waktu': 'x 4',
          },
          {
            'nama': 'Push-up Tangan Di Atas Bangku',
            'waktu': 'x 4',
          },
          {
            'nama': 'Tricip Dip',
            'waktu': 'x 4',
          },
          {
            'nama': 'Push-up Lutut',
            'waktu': 'x 4',
          },
          {
            'nama': 'Peregangan Kobra',
            'waktu': '00 : 20',
          },
          {
            'nama': 'Peregangan Dada',
            'waktu': '00 : 20',
          },
        ],
      },
      {
        'kalori': const [true, true, true],
        'nama': 'Perut',
        'level': 'Pemula',
        'waktu': '13',
        'favorit': false,
        'latihan': <dynamic>[
          {
            'nama': 'Loncat Bintang',
            'waktu': '00 : 20',
          },
          {
            'nama': 'Crunch Perut',
            'waktu': 'x 16',
          },
          {
            'nama': 'Puntir Rusia',
            'waktu': 'x 20',
          },
          {
            'nama': 'Pendaki Gunung',
            'waktu': 'x 16',
          },
          {
            'nama': 'Sentuh Tumit',
            'waktu': 'x 20',
          },
          {
            'nama': 'Angkat Kaki',
            'waktu': 'x 16',
          },
          {
            'nama': 'Plank',
            'waktu': '00 : 20',
          },
          {
            'nama': 'Crunch Perut',
            'waktu': 'x 12',
          },
          {
            'nama': 'Puntir Rusia',
            'waktu': 'x 32',
          },
          {
            'nama': 'Pendaki Gunung',
            'waktu': 'x 12',
          },
          {
            'nama': 'Sentuh Tumit',
            'waktu': 'x 20',
          },
          {
            'nama': 'Angkat Kaki',
            'waktu': 'x 14',
          },
          {
            'nama': 'Peregangan Kobra',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Puntir Lumbar Tulang Belakang',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Puntir Lumbar Tulang Belakang',
            'waktu': '00 : 30',
          },
        ],
      },
      {
        'kalori': const [true, false, false],
        'nama': 'Kaki',
        'level': 'Pemula',
        'waktu': '12',
        'favorit': true,
        'latihan': [
          {
            'nama': 'Loncat Bintang',
            'waktu': '00 : 20',
          },
          {
            'nama': 'Crunch Perut',
            'waktu': 'x 16',
          },
          {
            'nama': 'Puntir Rusia',
            'waktu': 'x 20',
          },
          {
            'nama': 'Pendaki Gunung',
            'waktu': 'x 16',
          },
          {
            'nama': 'Sentuh Tumit',
            'waktu': 'x 20',
          },
          {
            'nama': 'Angkat Kaki',
            'waktu': 'x 16',
          },
          {
            'nama': 'Plank',
            'waktu': '00 : 20',
          },
          {
            'nama': 'Crunch Perut',
            'waktu': 'x 12',
          },
          {
            'nama': 'Puntir Rusia',
            'waktu': 'x 32',
          },
          {
            'nama': 'Pendaki Gunung',
            'waktu': 'x 12',
          },
          {
            'nama': 'Sentuh Tumit',
            'waktu': 'x 20',
          },
          {
            'nama': 'Angkat Kaki',
            'waktu': 'x 14',
          },
          {
            'nama': 'Plank',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Kobra',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Puntir Lumbar Tulang Belakang',
            'waktu': '00 : 30',
          },
          {
            'nama': 'Peregangan Puntir Lumbar Tulang Belakang',
            'waktu': '00 : 30',
          },
        ],
      },
    ];

    return SafeArea(
      child: ListView.builder(
        itemCount: dataKategoriLatihan.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListLatihanPerKategori(
                    judul: dataKategoriLatihan[index]['nama'],
                    waktu: dataKategoriLatihan[index]['waktu'],
                    dataLatihan: dataKategoriLatihan[index]['latihan'],
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(
                12,
                (index == 0) ? 12 : 8,
                12,
                (index == dataKategoriLatihan.length - 1) ? 12 : 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          dataKategoriLatihan[index]['nama'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              dataKategoriLatihan[index]['level'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Container(
                              width: 4,
                              height: 4,
                              margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            Text(
                              'Estimasi ${dataKategoriLatihan[index]['waktu']} Menit',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: <Widget>[
                            for (int i = 0;
                                i < dataKategoriLatihan[index]['kalori'].length;
                                i++) ...{
                              Icon(
                                Icons.local_fire_department_rounded,
                                size: 20,
                                color: (dataKategoriLatihan[index]['kalori'][i])
                                    ? blueColor
                                    : grayColor,
                              ),
                              if (i <
                                  dataKategoriLatihan[index]['kalori'].length -
                                      1)
                                const SizedBox(
                                  width: 2,
                                ),
                            },
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CustomPaint(
                      size: Size(
                        screenWidth - 24,
                        80,
                      ),
                      painter: WavePainter(),
                    ),
                  ),
                  FavoritIkon(
                    dataKategoriLatihan: dataKategoriLatihan,
                    index: index,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = primaryColor;
    var path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.cubicTo(size.width * 0.55, size.height * 0.55, size.width * 0.95,
        size.height * 0.95, 0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) {
    return true;
  }
}
