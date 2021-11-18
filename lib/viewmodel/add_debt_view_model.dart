import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:intl/intl.dart';

class AddDebtViewModel extends ChangeNotifier {
  var amount = TextEditingController(text: "0.00");

  var afterMonth = DateTime.now().add(const Duration(days: 31));
  int selectedDay = 1;
  String selectedHour = '13:30';
  late var selectedYear = afterMonth.year;
  late var selectedMonth = afterMonth.month;

  ItemScrollController yearScrollController = ItemScrollController();
  ItemScrollController monthScrollController = ItemScrollController();
  ItemScrollController hourScrollController = ItemScrollController();

  var noteTextEditingController = TextEditingController();

  bool viewYearsAndMonths = false;

  bool isLoading = false;

  final List<String> hours = [
    for (int i = 60, j = 1; i <= 1410; i += 30, j++)
      (i ~/ 60).toString() + ':' + (j.isOdd ? '00' : '30')
  ];

  final List years = [
    for (int i = 0, thisYear = DateTime.now().year; i <= 10; i++) thisYear++
  ];

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  late List days = _getDays();

  List _getDays() {
    return [
      for (int i = 1; i <= DateTime(selectedYear, selectedMonth, 0).day; i++)
        [
          i,
          DateFormat('EEEE')
              .format(DateTime(selectedYear, selectedMonth, i))
              .substring(0, 3)
        ]
    ];
  }

  selectYear(int index) {
    selectedYear = years[index];

    days = _getDays();
    notifyListeners();
  }

  selectMonth(int index) {
    selectedMonth = index + 1;

    days = _getDays();
    notifyListeners();
  }

  selectDay(int index) {
    selectedDay = index + 1;
    notifyListeners();
  }

  selectHour(int index) {
    selectedHour = hours[index];
    notifyListeners();
  }

  selectViewYearsAndMonths() {
    viewYearsAndMonths = true;
    notifyListeners();
  }

  setDebtAmount(String text) {
    amount.text = "\$" + text + ".00";
    notifyListeners();
  }

  tapDebtAmount() {
    if (amount.text == "0.00") {
      amount.text = "";
    } else {
      amount.text = amount.text.replaceAll(RegExp(r'.00'), '');
    }
    notifyListeners();
  }
}
