import 'package:flutter/material.dart';
import 'package:spizac/variables/constants.dart';

class Opening extends StatelessWidget {
  const Opening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                padding: const EdgeInsets.all(48),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo_x186.png',
                        width: 200,
                        fit: BoxFit.fitWidth,
                        semanticLabel: 'Logo Spizac',
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Text(
                        'SPIZAC',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          color: primaryColor,
                          fontFamily: 'Plaster',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
