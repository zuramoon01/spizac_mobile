import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';

class FavoritIkon extends StatefulWidget {
  final List dataKategoriLatihan;
  final int index;

  const FavoritIkon({
    Key? key,
    required this.dataKategoriLatihan,
    required this.index,
  }) : super(key: key);

  @override
  State<FavoritIkon> createState() => _FavoritIkonState();
}

class _FavoritIkonState extends State<FavoritIkon> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 9,
      right: 21,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.dataKategoriLatihan[widget.index]['favorit'] =
                !widget.dataKategoriLatihan[widget.index]['favorit'];
          });
        },
        child: Icon(
          Icons.star_rounded,
          size: 24,
          color: (widget.dataKategoriLatihan[widget.index]['favorit'])
              ? yellowColor
              : grayColor,
        ),
      ),
    );
  }
}
