// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CalendarPage extends StatefulWidget {
//   const CalendarPage({Key? key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _CalendarPageState createState() => _CalendarPageState();
// }
//
// class _CalendarPageState extends State<CalendarPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//           margin: EdgeInsets.only(top: 40.w),
//           child: SfCalendar(
//             view: CalendarView.month,
//             dataSource: MeetingDataSource(_getDataSource()),
//             monthViewSettings: const MonthViewSettings(
//                 appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
//           ),
//         ));
//   }
//
//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//     DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     meetings.add(Meeting(
//         'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//     return meetings;
//   }
// }
//
// /// An object to set the appointment collection data source to calendar, which
// /// used to map the custom appointment data to the calendar appointment, and
// /// allows to add, remove or reset the appointment collection.
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     return _getMeetingData(index).from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }
//
//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }
//
//     return meetingData;
//   }
// }
//
// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;
//
//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;
//
//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;
//
//   /// Background which is equivalent to color property of [Appointment].
//   Color background;
//
//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

import 'dart:async';
import 'dart:collection';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/data/models/musicalModel.dart';
import 'package:miniproject/utils/calendar_util.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final PageController _pageController;
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  // final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // );
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    // _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  // bool get canClearSelection =>
  //     _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      this._selectedDay = selectedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedEvents.value = _getEventsForDay(this._selectedDay!);
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      //_selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  myDatePicker(context) {
    return DatePicker.showDatePicker(context,
        minTime: kFirstDay, maxTime: kLastDay, onConfirm: (date) {
      setState(() {
        _focusedDay.value = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 40.w,
        //   backgroundColor: Colors.white,
        //   foregroundColor: Colors.black,
        //   shadowColor: Colors.transparent,
        //   title: Text('TableCalendar - Complex'),
        //),
        body: Column(
          children: [
            ValueListenableBuilder<DateTime>(
                valueListenable: _focusedDay,
                builder: (context, value, _) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 16.w),
                        GestureDetector(
                          onTap: () {
                            myDatePicker(context);
                          },
                          child: SizedBox(
                            width: 150.w,
                            child: Text(
                              DateFormat.yMMM().format(_focusedDay.value),
                              style: TextStyle(fontSize: 26.w),
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.chevron_left),
                          onPressed: () {

                              _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );

                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.chevron_right),
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }),
            // ValueListenableBuilder<DateTime>(
            //   valueListenable: _focusedDay,
            //   builder: (context, value, _) {
            //     return _CalendarHeader (
            //       focusedDay: value,
            //       clearButtonVisible: false,//canClearSelection,
            //       onTodayButtonTap: () {
            //
            //       },
            //       onClearButtonTap: () {
            //         setState(() {
            //           _rangeStart = null;
            //           _rangeEnd = null;
            //           _selectedEvents.value = [];
            //         });
            //       },
            //       onLeftArrowTap: () {
            //         _pageController.previousPage(
            //           duration: Duration(milliseconds: 300),
            //           curve: Curves.easeOut,
            //         );
            //       },
            //       onRightArrowTap: () {
            //         _pageController.nextPage(
            //           duration: Duration(milliseconds: 300),
            //           curve: Curves.easeOut,
            //         );
            //       },
            //     );
            //   },
            // ),
            TableCalendar<Event>(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay.value,
              headerVisible: false,
              //  selectedDayPredicate: (day) => _selectedDays.contains(day),
              // currentDay: _selectedDay,
              //  rangeStartDay: _rangeStart,
              //  rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              eventLoader: _getEventsForDay,
              holidayPredicate: (day) {
                // Every 20th day of the month will be treated as a holiday
                return false; // day.day == 20;
              },
              onDaySelected: _onDaySelected,
              onRangeSelected: _onRangeSelected,
              onCalendarCreated: (controller) => _pageController = controller,
              onPageChanged: (focusedDay) => _selectedEvents.value=[],//_focusedDay.value = focusedDay,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() => _calendarFormat = format);
                }
              },
              rowHeight: 100.w,
              calendarStyle: CalendarStyle(
                  //   markerSizeScale: 5,
                  canMarkersOverflow: false,
                  markersMaxCount: 1,
                  markerSize: 100.w,
                  markerDecoration: BoxDecoration(
                      // shape: BoxShape.rectangle,
                      image: DecorationImage(
                          //  fit:BoxFit.scaleDown,
                          image: NetworkImage(
                              "http://www.kopis.or.kr/upload/pfmPoster/PF_PF184635_211209_115824.gif")))),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: ListTile(
                          onTap: () => print('${value[index]}'),
                          title: Text('${value[index]}'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  CallbackAction onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {
              onTodayButtonTap;
            },
            child: SizedBox(
              width: 150.w,
              child: Text(
                headerText,
                style: TextStyle(fontSize: 26.w),
              ),
            ),
          ),
          // IconButton(
          //   icon: Icon(Icons.calendar_today, size: 20.0),
          //   visualDensity: VisualDensity.compact,
          //   onPressed: onTodayButtonTap,
          // ),
          if (clearButtonVisible)
            IconButton(
              icon: Icon(Icons.clear, size: 20.0),
              visualDensity: VisualDensity.compact,
              onPressed: onClearButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
}
