import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spizac/variables/constants.dart';

class TanggalPerBlok extends StatelessWidget {
  final int index;
  final bool hariIni;

  const TanggalPerBlok({
    Key? key,
    required this.index,
    required this.hariIni,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    const double width320x = 320;
    const double width375x = 375;
    const double width425x = 425;

    return Container(
      width: (screenWidth > width425x)
          ? ((width425x - 24) - (8 * 6)) / 7
          : (screenWidth <= width425x && screenWidth > width375x)
              ? ((width375x - 24) - (8 * 6)) / 7
              : ((width320x - 24) - (8 * 6)) / 7,
      constraints: const BoxConstraints(
        minWidth: 36,
        minHeight: 52,
        maxHeight: 60,
      ),
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      decoration: BoxDecoration(
        color: (hariIni) ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateFormat.E('id').format(
              DateTime.now().add(
                Duration(days: index),
              ),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: (hariIni) ? Colors.white : primaryColor,
            ),
          ),
          Text(
            DateFormat.d().format(DateTime.now().add(Duration(days: index))),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: (hariIni) ? Colors.white : primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
