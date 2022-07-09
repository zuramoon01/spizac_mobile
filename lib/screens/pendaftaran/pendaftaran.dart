import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/app.dart';
import 'package:spizac/providers/pendaftaran.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/screens/pendaftaran/badan.dart';
import 'package:spizac/screens/pendaftaran/jenis_kelamin.dart';
import 'package:spizac/variables/constants.dart';

class Pendaftaran extends StatelessWidget {
  const Pendaftaran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    final PendaftaranProvider pendaftaranProvider =
        Provider.of<PendaftaranProvider>(context);
    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    final double screenHeight = MediaQuery.of(context).size.height;

    final List<dynamic> screensPendaftaran = [
      {
        'langkah': 1,
        'judul': 'Jenis Kelamin',
        'keterangan':
            'Kami ingin mengetahui jenis kelamin Anda untuk dapat mempersonalisasikan bentuk latihan Anda.',
        'widget': const JenisKelamin(),
      },
      {
        'langkah': 2,
        'judul': 'Tinggi Badan',
        'keterangan':
            'Kami ingin mengetahui tinggi badan Anda untuk bisa memberi rekomendasi Latihan yang cocok untuk Anda.',
        'widget': TinggiDanBeratBadan(
          index: 1,
          bCtrl: profilProvider.tbTF,
          image: 'assets/images/tinggi_badan.png',
          ukuran: 'Cm',
        ),
      },
      {
        'langkah': 3,
        'judul': 'Berat Badan',
        'keterangan':
            'Kami ingin mengetahui berat badan Anda untuk bisa memberi rekomendasi Latihan yang cocok untuk Anda.',
        'widget': TinggiDanBeratBadan(
          index: 2,
          bCtrl: profilProvider.bbTF,
          image: 'assets/images/berat_badan.png',
          ukuran: 'Kg',
        ),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo_x186.png',
                      height: 80,
                      fit: BoxFit.fitHeight,
                      semanticLabel: 'Logo Spizac',
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      'Langkah ${screensPendaftaran[pendaftaranProvider.indexScreen]['langkah'].toString()} / 3',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 1; i < 4; i++) ...{
                          Container(
                            width: 36,
                            height: 4,
                            decoration: BoxDecoration(
                              color: (screensPendaftaran[pendaftaranProvider
                                          .indexScreen]['langkah'] ==
                                      i)
                                  ? primaryColor
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          if (i < 3)
                            const SizedBox(
                              width: 4,
                            ),
                        },
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      screensPendaftaran[pendaftaranProvider.indexScreen]
                          ['judul'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 254,
                      ),
                      child: Text(
                        screensPendaftaran[pendaftaranProvider.indexScreen]
                            ['keterangan'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    screensPendaftaran[pendaftaranProvider.indexScreen]
                        ['widget'],
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: (pendaftaranProvider.indexScreen == 0 &&
                          (profilProvider.jkLaki || profilProvider.jkPerempuan))
                      ? () {
                          pendaftaranProvider.indexScreen += 1;
                        }
                      : (pendaftaranProvider.indexScreen == 1 &&
                              profilProvider.tbTFText.isNotEmpty)
                          ? () {
                              pendaftaranProvider.indexScreen += 1;
                            }
                          : (pendaftaranProvider.indexScreen == 2 &&
                                  profilProvider.bbTFText.isNotEmpty)
                              ? () {
                                  pendaftaranProvider.indexScreen = 3;
                                  appProvider.indexScreen = 2;
                                }
                              : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(240, 48),
                    primary: primaryColor,
                  ),
                  child: const Text(
                    'Selanjutnya',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
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
