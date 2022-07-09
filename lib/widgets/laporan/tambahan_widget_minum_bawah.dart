import 'package:flutter/material.dart';

class TambahanWidgetMinumBawah extends StatelessWidget {
  final List<dynamic> dataLaporanMinum;

  const TambahanWidgetMinumBawah({
    Key? key,
    required this.dataLaporanMinum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int i = 0; i < dataLaporanMinum.length; i++) ...{
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      dataLaporanMinum[i]['nama'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      dataLaporanMinum[i]['keterangan'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              if (i < dataLaporanMinum.length - 1)
                const SizedBox(
                  width: 12,
                ),
            },
          ],
        ),
      ],
    );
  }
}
