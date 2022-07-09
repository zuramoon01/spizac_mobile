import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/screens/profil/edit_akun.dart';
import 'package:spizac/screens/profil/pengaturan_tambahkan.dart';
import 'package:spizac/screens/profil/pengaturan_tentang.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/variables/profil.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    final double screenWidth = MediaQuery.of(context).size.width;

    final List<dynamic> dataProfilUmum = [
      {
        'icon': Icons.person_add_alt_rounded,
        'title': 'Tambahkan',
        'widget': const PengaturanTambahkan(),
        'iconClick': Icons.chevron_right_rounded,
      },
      {
        'icon': (profilProvider.notifikasi)
            ? Icons.notifications_on_rounded
            : Icons.notifications_off_rounded,
        'title': 'Notifikasi',
        'iconClick': null,
      },
      {
        'icon': Icons.error_outline,
        'title': 'Tentang',
        'widget': const PengaturanTentang(),
        'iconClick': Icons.chevron_right_rounded,
      },
    ];

    final List<dynamic> dataPerangkatDanSpotify = [
      {
        'title': 'Perangkat',
        'image': 'assets/images/perangkat.png',
      },
      {
        'title': 'Spotify',
        'image': 'assets/images/spotify.png',
      },
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: blueColor,
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        'assets/images/Luke_(AP).jpg',
                        fit: BoxFit.fitWidth,
                        alignment: const Alignment(0, -1),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          profilProvider.namaTFText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          profilProvider.negaraTFText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditAkun(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.edit_rounded,
                      size: 24,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            templateJudul(
              'Belanja',
              screenWidth,
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(screenWidth - 12, 52),
                    primary: Colors.white,
                    side: BorderSide(
                      color: primaryColor,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_bag,
                    size: 20,
                    color: primaryColor,
                  ),
                  label: Text(
                    'Klik disini untuk berbelanja',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            pemberiBatas(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                for (int i = 0; i < dataPerangkatDanSpotify.length; i++) ...{
                  templateJudul(
                    dataPerangkatDanSpotify[i]['title'],
                    screenWidth,
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        (i == 0) ? 12 : 6,
                        0,
                        (i == dataPerangkatDanSpotify.length - 1) ? 12 : 6,
                        0,
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: ((screenWidth - 24) / 2) - 6,
                        ),
                        child: Image.asset(
                          dataPerangkatDanSpotify[i]['image'],
                          fit: BoxFit.fitWidth,
                          width: ((screenWidth - 24) / 2) - 6,
                        ),
                      ),
                    ),
                  ),
                },
              ],
            ),
            pemberiBatas(),
            templateJudul(
              'Umum',
              screenWidth,
              Column(
                children: <Widget>[
                  for (int i = 0; i < dataProfilUmum.length; i++) ...{
                    Container(
                      padding: const EdgeInsets.all(12),
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 24,
                            height: 24,
                            alignment: Alignment.center,
                            child: Icon(
                              dataProfilUmum[i]['icon'],
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: Text(
                              dataProfilUmum[i]['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          (dataProfilUmum[i]['title'] == 'Notifikasi')
                              ? Transform.scale(
                                  alignment: Alignment.centerRight,
                                  scale: (0.8),
                                  child: Switch(
                                    value: profilProvider.notifikasi,
                                    onChanged: (value) {
                                      profilProvider.notifikasi = value;
                                    },
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            dataProfilUmum[i]['widget'],
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    dataProfilUmum[i]['iconClick'],
                                  ),
                                ),
                        ],
                      ),
                    ),
                    if (i < dataProfilUmum.length - 1)
                      Divider(
                        color: Colors.black.withOpacity(0.1),
                        height: 0.1,
                        thickness: 1,
                      ),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
