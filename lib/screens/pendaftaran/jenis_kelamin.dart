import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/variables/constants.dart';

class JenisKelamin extends StatelessWidget {
  const JenisKelamin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    final List<dynamic> dataJenisKelamin = [
      {
        'icon': Icons.man_rounded,
        'iconColor': blueColor,
        'jenisKelamin': 'Laki - Laki',
      },
      {
        'icon': Icons.woman_rounded,
        'iconColor': redColor,
        'jenisKelamin': 'Perempuan',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < dataJenisKelamin.length; i++) ...{
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  (dataJenisKelamin[i]['jenisKelamin'] == 'Laki - Laki')
                      ? profilProvider.jkLaki = !profilProvider.jkLaki
                      : profilProvider.jkPerempuan =
                          !profilProvider.jkPerempuan;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        (dataJenisKelamin[i]['jenisKelamin'] == 'Laki - Laki')
                            ? (profilProvider.jkLaki)
                                ? dataJenisKelamin[i]['iconColor']
                                : grayColor
                            : (profilProvider.jkPerempuan)
                                ? dataJenisKelamin[i]['iconColor']
                                : grayColor,
                    borderRadius: BorderRadius.circular(120 / 16),
                  ),
                  child: Icon(
                    dataJenisKelamin[i]['icon'],
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                dataJenisKelamin[i]['jenisKelamin'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          if (i < dataJenisKelamin.length - 1)
            const SizedBox(
              width: 24,
            ),
        },
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
