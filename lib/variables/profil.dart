import 'package:flutter/material.dart';

Column templateJudul(String text, double screenWidth, Widget widget) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SizedBox(
          width: ((screenWidth - 24) / 2) - 12,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      widget,
      const SizedBox(
        height: 12,
      ),
    ],
  );
}

Padding pemberiBatas() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
    child: Column(
      children: <Widget>[
        Divider(
          color: Colors.black.withOpacity(0.1),
          height: 0.1,
          thickness: 1,
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    ),
  );
}
