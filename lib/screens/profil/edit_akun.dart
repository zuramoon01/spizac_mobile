import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/profil.dart';
import 'package:spizac/variables/constants.dart';

class EditAkun extends StatelessWidget {
  const EditAkun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilProvider profilProvider = Provider.of<ProfilProvider>(context);

    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: pushAppBar('Edit Akun'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(24),
                width: 160,
                height: 160,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.4),
                ),
                child: Image.asset(
                  'assets/images/Luke_(AP).jpg',
                  fit: BoxFit.fitWidth,
                  alignment: const Alignment(0, -1),
                ),
              ),
              titleTextfield('Nama'),
              customTF(
                profilProvider,
                'nama',
                'text',
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        titleTextfield('Berat Badan'),
                        Stack(
                          children: [
                            customTF(
                              profilProvider,
                              'bb',
                              'number',
                            ),
                            const Positioned(
                              top: 13,
                              left: 50,
                              child: Text(
                                'Kg',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        titleTextfield('Tinggi Badan'),
                        Stack(
                          children: [
                            customTF(
                              profilProvider,
                              'tb',
                              'number',
                            ),
                            const Positioned(
                              top: 13,
                              left: 50,
                              child: Text(
                                'Cm',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              titleTextfield('Email'),
              customTF(
                profilProvider,
                'email',
                'text',
              ),
              titleTextfield('Negara'),
              customTF(
                profilProvider,
                'negara',
                'text',
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                  minimumSize: Size(screenWidth - 24, 48),
                  primary: primaryColor,
                ),
                onPressed: (profilProvider.namaTF.text.isNotEmpty &&
                        profilProvider.bbTF.text.isNotEmpty &&
                        profilProvider.tbTF.text.isNotEmpty &&
                        profilProvider.emailTF.text.isNotEmpty &&
                        profilProvider.negaraTF.text.isNotEmpty)
                    ? () {
                        profilProvider.namaTFText = profilProvider.namaTF.text;
                        profilProvider.bbTFText = profilProvider.bbTF.text;
                        profilProvider.tbTFText = profilProvider.tbTF.text;
                        profilProvider.emailTFText =
                            profilProvider.emailTF.text;
                        profilProvider.negaraTFText =
                            profilProvider.negaraTF.text;

                        Navigator.pop(context);
                      }
                    : null,
                child: const Text(
                  'Simpan',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container customTF(
    ProfilProvider profilProvider,
    String ctrlName,
    String type,
  ) {
    checkBorderColor() {
      if (ctrlName == 'nama') {
        if (profilProvider.namaTF.text.isEmpty) {
          return OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 1,
            ),
          );
        } else {
          return InputBorder.none;
        }
      } else if (ctrlName == 'bb') {
        if (profilProvider.bbTF.text.isEmpty) {
          return OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 1,
            ),
          );
        } else {
          return InputBorder.none;
        }
      } else if (ctrlName == 'tb') {
        if (profilProvider.tbTF.text.isEmpty) {
          return OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 1,
            ),
          );
        } else {
          return InputBorder.none;
        }
      } else if (ctrlName == 'email') {
        if (profilProvider.emailTF.text.isEmpty) {
          return OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 1,
            ),
          );
        } else {
          return InputBorder.none;
        }
      } else if (ctrlName == 'negara') {
        if (profilProvider.negaraTF.text.isEmpty) {
          return OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 1,
            ),
          );
        } else {
          return InputBorder.none;
        }
      }
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            offset: const Offset(0, 0.4),
          ),
        ],
      ),
      child: TextField(
        controller: (ctrlName == 'nama')
            ? profilProvider.namaTF
            : (ctrlName == 'bb')
                ? profilProvider.bbTF
                : (ctrlName == 'tb')
                    ? profilProvider.tbTF
                    : (ctrlName == 'email')
                        ? profilProvider.emailTF
                        : profilProvider.negaraTF,
        onChanged: (String text) {
          (ctrlName == 'nama')
              ? profilProvider.namaTFText = text
              : (ctrlName == 'bb')
                  ? profilProvider.bbTFText = text
                  : (ctrlName == 'tb')
                      ? profilProvider.tbTFText = text
                      : (ctrlName == 'email')
                          ? profilProvider.emailTFText = text
                          : profilProvider.negaraTFText = text;
        },
        maxLength: (type == 'number') ? 3 : 50,
        keyboardType:
            (type == 'number') ? TextInputType.number : TextInputType.text,
        inputFormatters: <TextInputFormatter>[
          if (type == 'number') FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          counterText: '',
          border: checkBorderColor(),
          enabledBorder: checkBorderColor(),
          focusedBorder: checkBorderColor(),
        ),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Align titleTextfield(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
