import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';


class DatePickerUtils extends StatelessWidget {
  const DatePickerUtils({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              DateTime? selectedDate = await DateTimePickerUtils.pickDate(context);
              if (selectedDate != null) {
                print("Selected date: $selectedDate");
              }
            },
            child: Text("Pick Date"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? selectedTime = await DateTimePickerUtils.pickTime(context);
              if (selectedTime != null) {
                print("Selected time: ${selectedTime.hour}:${selectedTime.minute}");
              }
            },
            child: Text("Pick Time"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              DateTime? selectedDateTime = await DateTimePickerUtils.pickCupertinoDateAndTime(context);
              if (selectedDateTime != null) {
                print("Selected date and time: $selectedDateTime");
              }
            },
            child: Text("Pick Date and Time"),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              DateTime? selectedDateTime = await DateTimePickerUtils.pickDateAndTime(context);
              if (selectedDateTime != null) {
                print("Selected date and time: $selectedDateTime");
              }
            },
            child: Text("Pick Date and Time (Material)"),
          ),
        ],
      ),
    );
  }
}





class DateTimePickerUtils {
  /// Material Date Picker - Shows Material date picker and returns selected date
  static Future<DateTime?> pickDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    SelectableDayPredicate? selectableDayPredicate,
    String? helpText,
    String? cancelText,
    String? confirmText,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(DateTime.now().year - 6),
      lastDate: lastDate ?? DateTime(DateTime.now().year + 3),
      initialEntryMode: initialEntryMode,
      selectableDayPredicate: selectableDayPredicate,
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
    );
  }

  /// Material Time Picker - Shows Material time picker and returns selected time
  static Future<TimeOfDay?> pickTime(
    BuildContext context, {
    TimeOfDay? initialTime,
    String? helpText,
    String? cancelText,
    String? confirmText,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  }) async {
    return await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      helpText: helpText,
      cancelText: cancelText,
      confirmText: confirmText,
      initialEntryMode: initialEntryMode,
    );
  }

  /// Cupertino Date Picker - Shows iOS-style date picker with optional time
  static Future<DateTime?> pickCupertinoDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minimumDate,
    DateTime? maximumDate,
    CupertinoDatePickerMode mode = CupertinoDatePickerMode.date,
    String? cancelText,
    String? confirmText,
    double? height,
    bool use24hFormat = false,
    int minuteInterval = 1,
  }) async {
    final initialDateTime = initialDate ?? DateTime.now();
    final completer = Completer<DateTime?>();
    DateTime? selectedDate = initialDateTime;

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height ?? 300,
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(cancelText ?? 'Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(null);
                    },
                  ),
                  CupertinoButton(
                    child: Text(confirmText ?? 'Confirm'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(selectedDate);
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: mode,
                  initialDateTime: initialDateTime,
                  minimumDate: minimumDate ?? DateTime(DateTime.now().year - 6),
                  maximumDate: maximumDate ?? DateTime(DateTime.now().year + 3),
                  use24hFormat: use24hFormat,
                  minuteInterval: minuteInterval,
                  onDateTimeChanged: (DateTime newDate) {
                    selectedDate = newDate;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return completer.future;
  }

  /// Cupertino Time Picker - Shows iOS-style time picker
  static Future<TimeOfDay?> pickCupertinoTime(
    BuildContext context, {
    TimeOfDay? initialTime,
    String? cancelText,
    String? confirmText,
    double? height,
    bool use24hFormat = false,
    int minuteInterval = 1,
  }) async {
    final now = DateTime.now();
    final initialDateTime = initialTime != null
        ? DateTime(
            now.year,
            now.month,
            now.day,
            initialTime.hour,
            initialTime.minute,
          )
        : now;
    
    final completer = Completer<TimeOfDay?>();
    DateTime? selectedDateTime = initialDateTime;

    await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height ?? 300,
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text(cancelText ?? 'Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(null);
                    },
                  ),
                  CupertinoButton(
                    child: Text(confirmText ?? 'Confirm'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      completer.complete(
                        selectedDateTime != null
                            ? TimeOfDay(
                                hour: selectedDateTime!.hour,
                                minute: selectedDateTime!.minute,
                              )
                            : null,
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: initialDateTime,
                  use24hFormat: use24hFormat,
                  minuteInterval: minuteInterval,
                  onDateTimeChanged: (DateTime newDateTime) {
                    selectedDateTime = newDateTime;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return completer.future;
  }

  /// Cupertino Date and Time Picker - Shows iOS-style date and time picker in one component
  static Future<DateTime?> pickCupertinoDateAndTime(
    BuildContext context, {
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
    String? cancelText,
    String? confirmText,
    double? height,
    bool use24hFormat = false,
    int minuteInterval = 1,
  }) async {
    return await pickCupertinoDate(
      context,
      initialDate: initialDateTime,
      minimumDate: minimumDate,
      maximumDate: maximumDate,
      mode: CupertinoDatePickerMode.dateAndTime,
      cancelText: cancelText,
      confirmText: confirmText,
      height: height,
      use24hFormat: use24hFormat,
      minuteInterval: minuteInterval,
    );
  }

  /// Material Date and Time Picker - Shows both date and time pickers sequentially
  static Future<DateTime?> pickDateAndTime(
    BuildContext context, {
    DateTime? initialDateTime,
    DateTime? firstDate,
    DateTime? lastDate,
    String? dateHelpText,
    String? timeHelpText,
    String? cancelText,
    String? confirmText,
  }) async {
    // First show date picker
    final initialDate = initialDateTime ?? DateTime.now();
    final selectedDate = await pickDate(
      context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      helpText: dateHelpText,
      cancelText: cancelText,
      confirmText: confirmText,
    );
    
    if (selectedDate == null) return null;
    
    // Then show time picker
    final initialTimeOfDay = TimeOfDay(
      hour: initialDate.hour,
      minute: initialDate.minute,
    );
    
    final selectedTime = await pickTime(
      context,
      initialTime: initialTimeOfDay,
      helpText: timeHelpText,
      cancelText: cancelText,
      confirmText: confirmText,
    );
    
    if (selectedTime == null) return null;
    
    // Combine date and time
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );
  }
}