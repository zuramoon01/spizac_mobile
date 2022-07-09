import 'package:flutter/material.dart';

class KeteranganLaporan extends StatelessWidget {
  final String judul;
  final String keterangan;
  final Widget widgetTambahanTengah;
  final Widget widgetTambahanBawah;

  const KeteranganLaporan({
    Key? key,
    required this.judul,
    required this.keterangan,
    required this.widgetTambahanTengah,
    required this.widgetTambahanBawah,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(
            minWidth: screenWidth - 24,
            minHeight: 499,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Align(
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
                  const SizedBox(
                    height: 8,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 261,
                    ),
                    child: Text(
                      keterangan,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
              widgetTambahanTengah,
              widgetTambahanBawah,
            ],
          ),
        ),
      ),
    );
  }
}
