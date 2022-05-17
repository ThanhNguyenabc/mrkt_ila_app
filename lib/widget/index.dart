import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrkt_app/utils/app_colors.dart';

final CEFRLevels = <int, dynamic>{
  0: {
    "key": "A1",
    "image": "asset/images/a1_level.png",
    "title": "A1 - Beginner",
    "color": AppColors.island,
    "color2": AppColors.saffron,
    "des":
        "English level A1 is the first level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level would be called “beginner”, and indeed, that is the official level descriptor in the CEFR, also used by EF SET. In practice it is possible to be at a pre-A1 level of English. A student who is just beginning to learn English, or who has no prior knowledge of English, is at a pre-A1 level."
  },
  1: {
    "key": "A2",
    "image": "asset/images/a2_level.png",
    "title": "A2 - Elementary",
    "color": AppColors.milkPunch,
    "color2": AppColors.alizarinCrimson,
    "des":
        "English level A2 is the second level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level might be described as “basic” as in “I speak basic English”. The official level descriptor in the CEFR is “elementary”, which means the same thing: it is the foundation. At this level, students have mastered the basics of English and can communicate simple, basic needs."
  },
  2: {
    "key": "B1",
    "image": "asset/images/b1_level.png",
    "title": "B1 - Intermediate",
    "color": AppColors.clearDay,
    "color2": AppColors.niagara,
    "des":
        "English level B1 is the third level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level would be called “intermediate”, and indeed, that is the official level descriptor in the CEFR. At this level, students are beyond the basics but they are still not able to work or study exclusively in English."
  },
  3: {
    "key": "B2",
    "image": "asset/images/b2_levvel.png",
    "title": "B2 - Upper intermediate",
    "color": AppColors.frostedMint,
    "color2": AppColors.fruitSalad,
    "des":
        "English level B2 is the fourth level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level might be called “confident”, as in “I am a confident English speaker”. The official level descriptor is “upper intermediate”. At this level, students can function independently in a variety of academic and professional environments in English, although with a limited range of nuance and precision."
  },
  4: {
    "key": "C1",
    "image": "asset/images/c1_level.png",
    "title": "C1 - Advanced",
    "color2": AppColors.violet,
    "color": AppColors.whitePointer,
    "des":
        "English level C1 is the fifth level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level might be called “advanced”, and that is the official level descriptor for this level as well, also used by EF SET. At this level, students can function independently and with a great deal of precision on a wide variety of subjects and in almost any setting without any prior preparation. "
  },
  5: {
    "key": "C2",
    "image": "asset/images/c2_level.png",
    "title": "C2 - Proficient",
    "color2": AppColors.scooter,
    "color": AppColors.blueChalk,
    "des":
        "English level C2 is the sixth and final level of English in the Common European Framework of Reference (CEFR), a definition of different language levels written by the Council of Europe. In everyday speech, this level might be called “bilingual”, as in “I am bilingual in English and French.” A well-educated native English speaker is technically at a C2 level. Relatively few English learners reach this level because their professional or academic goals do not require it."
  }
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
