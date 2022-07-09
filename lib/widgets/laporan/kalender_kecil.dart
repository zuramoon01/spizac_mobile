import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spizac/screens/laporan/kalender.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/widgets/laporan/tanggal_per_blok.dart';

class KalenderKecil extends StatelessWidget {
  const KalenderKecil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      DateFormat.EEEE('id').format(DateTime.now()),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '${DateFormat.MMMM('id').format(DateTime.now())}${DateFormat(', d y').format(DateTime.now())}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
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
                      builder: (context) => const Kalender(),
                    ),
                  );
                },
                child: Icon(
                  Icons.calendar_month_rounded,
                  size: 32,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              for (var i = 0; i < 7; i++)
                (i == 0)
                    ? TanggalPerBlok(
                        index: i,
                        hariIni: true,
                      )
                    : TanggalPerBlok(
                        index: i,
                        hariIni: false,
                      )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
