import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:spizac/providers/laporan.dart';
import 'package:spizac/variables/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class Kalender extends StatelessWidget {
  const Kalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LaporanProvider laporanProvider =
        Provider.of<LaporanProvider>(context);

    return Scaffold(
      appBar: pushAppBar('Kalender'),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 1,
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0,
                      blurRadius: 12,
                      blurStyle: BlurStyle.solid,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TableCalendar(
                  locale: 'id',
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                  focusedDay: laporanProvider.focusedDay,
                  calendarFormat: laporanProvider.format,
                  sixWeekMonthsEnforced: true,
                  selectedDayPredicate: (day) {
                    return isSameDay(laporanProvider.selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(laporanProvider.selectedDay, selectedDay)) {
                      laporanProvider.selectedDay = selectedDay;
                      laporanProvider.focusedDay = focusedDay;
                    }
                  },
                  onFormatChanged: (format) {
                    if (laporanProvider.format != format) {
                      laporanProvider.format = format;
                    }
                  },
                  onPageChanged: (focusedDay) {
                    laporanProvider.focusedDay = focusedDay;
                  },
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  for (dynamic data in laporanProvider
                      .dataListLatihanYangSudahDikerjakan) ...{
                    if (data['tanggal'] ==
                        DateFormat('d MMMM y', 'id')
                            .format(laporanProvider.selectedDay)
                            .toString()) ...{
                      for (int i = 0; i < data['data'].length; i++) ...{
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          margin: EdgeInsets.fromLTRB(
                              0, 0, 0, (i < data['data'].length - 1) ? 16 : 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int j = 0; j < 2; j++) ...{
                                Text(
                                  (j == 0)
                                      ? data['tanggal']
                                      : data['data'][i]['nama'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: (j == 0) ? 8 : 16,
                                    fontWeight: (j == 0)
                                        ? FontWeight.w300
                                        : FontWeight.w700,
                                  ),
                                ),
                              },
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.schedule,
                                        size: 16,
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        data['data'][i]['waktu'],
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Row(
                                    children: [
                                      for (int j = 0;
                                          j < data['data'][i]['kalori'].length;
                                          j++) ...{
                                        Icon(
                                          Icons.local_fire_department,
                                          size: 16,
                                          color: (data['data'][i]['kalori'][j])
                                              ? blueColor
                                              : grayColor,
                                        ),
                                        if (i <
                                            data['data'][i]['kalori'].length -
                                                1)
                                          const SizedBox(
                                            width: 4,
                                          ),
                                      },
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      },
                    },
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
