import 'package:flutter/material.dart';

class PendaftaranProvider extends ChangeNotifier {
  int _indexScreen = 0;

  int get indexScreen => _indexScreen;
  set indexScreen(int index) {
    _indexScreen = index;
    notifyListeners();
  }
}
