import 'package:flutter/material.dart';

class ProfilProvider extends ChangeNotifier {
  bool _jkLaki = false;
  bool _jkPerempuan = false;

  bool get jkLaki => _jkLaki;
  set jkLaki(bool value) {
    if (_jkPerempuan == true) _jkPerempuan = false;

    _jkLaki = value;
    notifyListeners();
  }

  bool get jkPerempuan => _jkPerempuan;
  set jkPerempuan(bool value) {
    if (_jkLaki == true) _jkLaki = false;

    _jkPerempuan = value;
    notifyListeners();
  }

  final TextEditingController _namaTF =
      TextEditingController(text: 'Nama Anda');
  final TextEditingController _bbTF = TextEditingController(text: '');
  final TextEditingController _tbTF = TextEditingController(text: '');
  final TextEditingController _emailTF =
      TextEditingController(text: 'Email Anda');
  final TextEditingController _negaraTF =
      TextEditingController(text: 'Indonesia');

  TextEditingController get namaTF => _namaTF;
  String get namaTFText => _namaTF.text;
  set namaTFText(String text) {
    _namaTF.text = text;
    _namaTF.selection =
        TextSelection.fromPosition(TextPosition(offset: _namaTF.text.length));
    notifyListeners();
  }

  TextEditingController get bbTF => _bbTF;
  String get bbTFText => _bbTF.text;
  set bbTFText(String text) {
    _bbTF.text = text;
    _bbTF.selection =
        TextSelection.fromPosition(TextPosition(offset: _bbTF.text.length));
    notifyListeners();
  }

  TextEditingController get tbTF => _tbTF;
  String get tbTFText => _tbTF.text;
  set tbTFText(String text) {
    _tbTF.text = text;
    _tbTF.selection =
        TextSelection.fromPosition(TextPosition(offset: _tbTF.text.length));
    notifyListeners();
  }

  TextEditingController get emailTF => _emailTF;
  String get emailTFText => _emailTF.text;
  set emailTFText(String text) {
    _emailTF.text = text;
    _emailTF.selection =
        TextSelection.fromPosition(TextPosition(offset: _emailTF.text.length));
    notifyListeners();
  }

  TextEditingController get negaraTF => _negaraTF;
  String get negaraTFText => _negaraTF.text;
  set negaraTFText(String text) {
    _negaraTF.text = text;
    _negaraTF.selection =
        TextSelection.fromPosition(TextPosition(offset: _negaraTF.text.length));
    notifyListeners();
  }

  bool _notifikasi = false;

  bool get notifikasi => _notifikasi;
  set notifikasi(bool value) {
    _notifikasi = value;
    notifyListeners();
  }

  String _tambahkanGV = 'Publik';

  String get tambahkanGV => _tambahkanGV;
  set tambahkanGV(String value) {
    _tambahkanGV = value;
    notifyListeners();
  }
}
