import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/variables/constants.dart';
import 'package:spizac/variables/profil.dart';

class PengaturanTambahkan extends StatelessWidget {
  const PengaturanTambahkan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    List<String> dataPerangkat = ['Smartwatch', 'Sepatu', 'Timbangan'];

    List<dynamic> dataTeman = [
      {
        'index': 1,
        'text': 'Pindai kode QR',
        'icon': Icons.qr_code_scanner_rounded,
      },
      {
        'index': 2,
        'text': 'Kode QR saya',
        'icon': Icons.qr_code_rounded,
      },
    ];

    List<dynamic> dataStatus = [
      {
        'text': 'Semua orang (Publik)',
        'value': 'Publik',
      },
      {
        'text': 'Hanya Teman (Sosial)',
        'value': 'Sosial',
      },
      {
        'text': 'Hanya Saya (Private)',
        'value': 'Private',
      },
    ];

    return Scaffold(
      appBar: pushAppBar('Tambahkan'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
          child: Column(
            children: <Widget>[
              templateJudul(
                'Perangkat',
                screenWidth,
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Row(
                    children: <Widget>[
                      for (int i = 0; i < dataPerangkat.length; i++) ...{
                        Container(
                          padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            dataPerangkat[i],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (i < dataPerangkat.length - 1)
                          const SizedBox(
                            width: 12,
                          ),
                      },
                    ],
                  ),
                ),
              ),
              pemberiBatas(),
              templateJudul(
                'Teman',
                screenWidth,
                Column(
                  children: <Widget>[
                    for (dynamic data in dataTeman) ...{
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(screenWidth - 12, 52),
                            primary: (data['index'] == 2)
                                ? Colors.white
                                : primaryColor,
                          ),
                          onPressed: () {},
                          icon: Icon(
                            data['icon'],
                            size: 20,
                            color: (data['index'] == 1)
                                ? Colors.white
                                : primaryColor,
                          ),
                          label: Text(
                            data['text'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: (data['index'] == 1)
                                  ? Colors.white
                                  : primaryColor,
                            ),
                          ),
                        ),
                      ),
                      if (data['index'] == 1)
                        const SizedBox(
                          height: 8,
                        ),
                    },
                  ],
                ),
              ),
              pemberiBatas(),
              templateJudul(
                'Status',
                screenWidth,
                Column(
                  children: <Widget>[
                    for (int i = 0; i < dataStatus.length; i++) ...{
                      Container(
                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                dataStatus[i]['text'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Radio(
                              value: dataStatus[i]['value'].toString(),
                              groupValue: profilProvider.tambahkanGV,
                              onChanged: (value) {
                                profilProvider.tambahkanGV = value as String;
                              },
                            ),
                          ],
                        ),
                      ),
                      if (i < dataStatus.length - 1)
                        Divider(
                          color: Colors.black.withOpacity(0.1),
                          height: 0.1,
                          thickness: 1,
                        ),
                    }
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
