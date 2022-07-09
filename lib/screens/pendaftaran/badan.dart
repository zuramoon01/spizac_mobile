import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/profil.dart';

// ignore: must_be_immutable
class TinggiDanBeratBadan extends StatelessWidget {
  final int index;
  TextEditingController bCtrl;
  final String image;
  final String ukuran;

  TinggiDanBeratBadan({
    Key? key,
    required this.index,
    required this.bCtrl,
    required this.image,
    required this.ukuran,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    return Column(
      children: <Widget>[
        Container(
          width: 160,
          constraints: const BoxConstraints(minWidth: 160),
          child: Image.asset(
            image,
            width: 160,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            SizedBox(
              width: 48,
              child: TextField(
                controller: bCtrl,
                onChanged: (String text) {
                  (index == 1)
                      ? profilProvider.tbTFText = text
                      : profilProvider.bbTFText = text;
                },
                maxLength: 3,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                  isCollapsed: true,
                ),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: (ukuran == 'Cm') ? -31 : -24,
              child: Text(
                ukuran,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
