import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TambahanWidgetLariBawah extends StatelessWidget {
  final List<dynamic> dataLingkaranLari;

  const TambahanWidgetLariBawah({
    Key? key,
    required this.dataLingkaranLari,
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
          children: <Widget>[
            for (dynamic data in dataLingkaranLari)
              CircularPercentIndicator(
                radius: 36,
                lineWidth: 9,
                percent: 0.5,
                progressColor: data['color'],
                backgroundColor: data['backgroundColor'],
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 1000,
                center: Icon(
                  data['icon'],
                  size: 36,
                ),
                footer: Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Text(data['nama']),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
