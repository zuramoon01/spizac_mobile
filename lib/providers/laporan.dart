import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class LaporanProvider extends ChangeNotifier {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  CalendarFormat get format => _format;
  set format(CalendarFormat value) {
    _format = value;
    notifyListeners();
  }

  DateTime get selectedDay => _selectedDay;
  set selectedDay(DateTime value) {
    _selectedDay = value;
    notifyListeners();
  }

  DateTime get focusedDay => _focusedDay;
  set focusedDay(DateTime value) {
    _focusedDay = value;
    notifyListeners();
  }

  final List<dynamic> _dataListLatihanYangSudahDikerjakan = [
    {
      'tanggal': '5 Juni 2022',
      'data': [
        {
          'nama': 'Lengan',
          'waktu': '12 Menit',
          'kalori': const [true, false, false],
        },
      ],
    },
  ];

  int get panjangDataListLatihanYangSudahDikerjakan {
    for (dynamic tanggal in _dataListLatihanYangSudahDikerjakan) {
      if (tanggal['tanggal'] ==
          DateFormat('d MMMM y', 'id').format(DateTime.now()).toString()) {
        return tanggal['data'].length;
      }
    }
    return 0;
  }

  List<dynamic> get dataListLatihanYangSudahDikerjakan =>
      _dataListLatihanYangSudahDikerjakan;

  set dataListLatihanYangSudahDikerjakan(List<dynamic> dataLatihan) {
    bool checkTanggal = true;
    bool checkData = true;

    for (dynamic tanggal in _dataListLatihanYangSudahDikerjakan) {
      if (tanggal['tanggal'] == dataLatihan[0]['tanggal']) {
        checkTanggal = false;

        for (dynamic data in tanggal['data']) {
          if (data['nama'] == dataLatihan[0]['data'][0]['nama']) {
            checkData = false;
            break;
          }
        }

        if (checkData) tanggal['data'].add(dataLatihan[0]['data'][0]);
      }
    }

    if (checkTanggal) _dataListLatihanYangSudahDikerjakan.add(dataLatihan[0]);
    notifyListeners();
  }
}
