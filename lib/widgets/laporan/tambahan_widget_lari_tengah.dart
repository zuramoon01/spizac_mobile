import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:spizac/variables/constants.dart';

class TambahanWidgetLariTengah extends StatelessWidget {
  const TambahanWidgetLariTengah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100,
      lineWidth: 18,
      percent: 0.4,
      progressColor: primaryColor,
      backgroundColor: backgroundColor,
      animation: true,
      animationDuration: 1000,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.directions_run,
            size: 48,
          ),
          SizedBox(height: 6),
          Text(
            '250',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Meter',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
