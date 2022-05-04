import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';

final Map<int, Map<String, dynamic>> CEFRLevels = {
  0: {'level': 'A2', 'color': AppColors.saffron},
  1: {'level': 'B2', 'color': AppColors.niagara},
  2: {'level': 'C2', 'color': AppColors.scooter},
  3: {'level': 'A1', 'color': AppColors.alizarinCrimson},
  4: {'level': 'B1', 'color': AppColors.fruitSalad},
  5: {'level': 'C1', 'color': AppColors.violet}
};

void buildIOSDatePicker(
    BuildContext context, Function(DateTime) onDateTimeChanged,
    {CupertinoDatePickerMode mode = CupertinoDatePickerMode.date}) async {
  await showModalBottomSheet<bool>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).copyWith().size.height / 4,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: mode,
            onDateTimeChanged: onDateTimeChanged,
            initialDateTime: DateTime.now(),
            minimumYear: 1980,
            maximumYear: 2030,
          ),
        );
      });
}

void showCalendarPicker(
    BuildContext buildContext, Function(DateTime) onDateChanged) async {
  var date = await showDatePicker(
      context: buildContext,
      initialDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: DateTime(1980),
      lastDate: DateTime(2030));
  if (date != null) onDateChanged.call(date);
}

void showTimeDialog(
    BuildContext context, Function(TimeOfDay) onTimeChanged) async {
  var time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    builder: (context, child) {
      return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!);
    },
  );
  if (time != null) onTimeChanged.call(time);
}
