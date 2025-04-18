import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:intl/intl.dart';

class AntDatePickerDemoScreen extends StatefulWidget {
  const AntDatePickerDemoScreen({super.key});

  @override
  State<AntDatePickerDemoScreen> createState() =>
      _AntDatePickerDemoScreenState();
}

class _AntDatePickerDemoScreenState extends State<AntDatePickerDemoScreen> {
  DateTime? selectedDate;
  DateTimeRange? rangeDate;
  DateTime? timeDate;
  DateTime? dateTimeDate;
  DateTime? yearDate;
  DateTimeRange? yearRange;
  DateTime? monthDate;
  DateTimeRange? monthRange;
  DateTime? quarterDate;
  DateTime? weekDate;

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      // appBar: AppBar(title: Text('Ant Design DatePickers')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Date",
                pickerType: PickerType.date,
                selectedDate: selectedDate,
                onDateSelected: (date) => setState(() => selectedDate = date),
              ),
              const SizedBox(height: 20),

              Text(
                "Range Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Range",
                pickerType: PickerType.range,
                selectedRange: rangeDate,
                onRangeSelected: (range) => setState(() => rangeDate = range),
              ),
              const SizedBox(height: 20),

              Text(
                "Time Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Time",
                pickerType: PickerType.time,
                selectedDate: timeDate,
                onDateSelected: (date) => setState(() => timeDate = date),
              ),
              const SizedBox(height: 20),

              Text(
                "DateTime Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Date & Time",
                pickerType: PickerType.dateTime,
                selectedDate: dateTimeDate,
                onDateSelected: (date) => setState(() => dateTimeDate = date),
              ),
              const SizedBox(height: 20),

              Text(
                "Year Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Year",
                pickerType: PickerType.year,
                selectedDate: yearDate,
                onDateSelected: (date) => setState(() => yearDate = date),
              ),
              const SizedBox(height: 20),

              Text(
                "Year Range Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Year Range",
                pickerType: PickerType.range,
                selectedRange: yearRange,
                onRangeSelected: (range) => setState(() => yearRange = range),
              ),
              const SizedBox(height: 20),

              Text(
                "Month Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Month",
                pickerType: PickerType.month,
                selectedDate: monthDate,
                onDateSelected: (date) => setState(() => monthDate = date),
              ),
              const SizedBox(height: 20),

              Text(
                "Month Range Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Month Range",
                pickerType:  PickerType.quarter, // using quarter enum temporarily
                selectedRange: monthRange,
                onRangeSelected: (range) => setState(() {
                  print("Print the selected Quarter ::::: $range");
                  monthRange = range;
                } ),
              ),
              const SizedBox(height: 20),

              Text(
                "Quarter Picker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Quarter",
                pickerType: PickerType.quarter,
                selectedDate: quarterDate,
                onDateSelected: (date) => setState(() => quarterDate = date),
              ),
              const SizedBox(height: 20),

              // Text(
              //   "Week Picker",
              //   style: TextStyle(fontWeight: FontWeight.bold),
              // ),
              // const SizedBox(height: 10),
              // CommonDatePicker(
              //   label: "Select Week",
              //   pickerType: PickerType.date,
              //   selectedDate: weekDate,
              //   onDateSelected:
              //       (date) => setState(() => weekDate = getStartOfWeek(date)),
              // ),
              // const SizedBox(height: 20),


              Text(
                "Week Picker",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              CommonDatePicker(
                label: "Select Week",
                pickerType: PickerType.week,
                selectedDate: weekDate,
                onDateSelected: (date) => setState(() => weekDate = date),
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}

enum PickerType { date, range, time, dateTime, year, month, quarter, week }

class CommonDatePicker extends StatelessWidget {
  final String label;
  final PickerType pickerType;
  final DateTime? selectedDate;
  final DateTimeRange? selectedRange;
  final Function(DateTime)? onDateSelected;
  final Function(DateTimeRange)? onRangeSelected;
  final bool needConfirm;
  final bool showTime;
  final bool isDisabled;

  const CommonDatePicker({
    super.key,
    required this.label,
    required this.pickerType,
    this.selectedDate,
    this.selectedRange,
    this.onDateSelected,
    this.onRangeSelected,
    this.needConfirm = false,
    this.showTime = false,
    this.isDisabled = false,
  });

  String formatDate(DateTime date) {
    return "${date.year}-${twoDigits(date.month)}-${twoDigits(date.day)}";
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  DateTime getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  Future<void> select(BuildContext context) async {
    if (isDisabled) return;

    final now = DateTime.now();

    switch (pickerType) {
      case PickerType.date:
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) onDateSelected?.call(picked);
        break;

      case PickerType.range:
        final picked = await showDateRangePicker(
          context: context,
          initialDateRange:
              selectedRange ??
              DateTimeRange(start: now, end: now.add(const Duration(days: 7))),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 600,
                    maxHeight: 600,
                  ),
                  child: Material(color: Colors.transparent, child: child),
                ),
              ),
            );
          },
        );
        if (picked != null) onRangeSelected?.call(picked);
        break;

      case PickerType.time:
        final picked = await showTimePicker(
          context: context,
          initialTime:
              selectedDate != null
                  ? TimeOfDay.fromDateTime(selectedDate!)
                  : TimeOfDay.now(),
        );
        if (picked != null) {
          final dt = DateTime(
            now.year,
            now.month,
            now.day,
            picked.hour,
            picked.minute,
          );
          onDateSelected?.call(dt);
        }
        break;

      case PickerType.dateTime:
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          final pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(selectedDate ?? now),
          );
          if (pickedTime != null) {
            final dt = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            onDateSelected?.call(dt);
          }
        }
        break;

      case PickerType.year:
        showCustomPicker(
          context,
          label: "Select Year",
          items: List.generate(101, (i) => (2000 + i).toString()),
          onSelected: (value) {
            final year = int.tryParse(value);
            if (year != null) onDateSelected?.call(DateTime(year));
          },
        );
        break;

      case PickerType.month:
        showCustomPicker(
          context,
          label: "Select Month",
          items: List.generate(
            12,
            (i) => DateFormat.MMMM().format(DateTime(0, i + 1)),
          ),
          onSelected: (value) {
            final month = DateFormat.MMMM().parse(value).month;
            onDateSelected?.call(DateTime(now.year, month));
          },
        );
        break;

      case PickerType.quarter:
        showCustomPicker(
          context,
          label: "Select Quarter",
          items: ["Q1", "Q2", "Q3", "Q4"],
          onSelected: (value) {
            final quarter = {"Q1": 1, "Q2": 4, "Q3": 7, "Q4": 10}[value]!;
            onDateSelected?.call(DateTime(now.year, quarter));
          },
        );
        break;

      case PickerType.week:
        // For week selection, we'll use date picker but process it to get the week
        final picked = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? now,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          // Calculate the start of the week for the selected date
          final startOfWeek = getStartOfWeek(picked);
          onDateSelected?.call(startOfWeek);
        }
        break;
    }
  }

  void showCustomPicker(
    BuildContext context, {
    required String label,
    required List<String> items,
    required Function(String) onSelected,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        String selected = items.first;
        return AlertDialog(
          title: Text(label),
          content: SizedBox(
            height: 200,
            child: CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: 0),
              itemExtent: 32.0,
              onSelectedItemChanged: (index) {
                selected = items[index];
              },
              children: items.map((e) => Center(child: Text(e))).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onSelected(selected);
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }

  String getDisplayValue() {
    if (pickerType == PickerType.range && selectedRange != null) {
      return "${DateFormat.yMd().format(selectedRange!.start)} → ${DateFormat.yMd().format(selectedRange!.end)}";
    } else if (selectedDate != null) {
      switch (pickerType) {
        case PickerType.year:
          return DateFormat.y().format(selectedDate!);
        case PickerType.month:
          return DateFormat.yMMM().format(selectedDate!);
        case PickerType.quarter:
          final m = selectedDate!.month;
          final q = (m ~/ 3) + 1;
          return "Q$q ${selectedDate!.year}";
        case PickerType.time:
          return DateFormat.Hm().format(selectedDate!);
        case PickerType.dateTime:
          return DateFormat.yMd().add_Hm().format(selectedDate!);
        case PickerType.week:
          // Display the week range
          final start = selectedDate!; // This should already be the start of week
          final end = start.add(const Duration(days: 6));
          return "${formatDate(start)} → ${formatDate(end)}";
        default:
          return DateFormat.yMd().format(selectedDate!);
      }
    }
    return "Select";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => select(context),
      child: AbsorbPointer(
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
          child: Text(getDisplayValue()),
        ),
      ),
    );
  }
}







// enum PickerType {
//   date,
//   dateRange,
//   // month,
//   // year,
//   quarter,
//   // week,
// }

// class CommonDatePicker extends StatelessWidget {
//   final PickerType type;
//   final String label;
//   final DateTime? initialDate;
//   final void Function(DateTime start, [DateTime? end]) onChanged;

//   const CommonDatePicker({
//     super.key,
//     required this.type,
//     required this.label,
//     this.initialDate,
//     required this.onChanged,
//   });

//   void _showPicker(BuildContext context) async {
//     DateTime now = DateTime.now();
//     switch (type) {
//       case PickerType.date:
//         final picked = await showDatePicker(
//           context: context,
//           initialDate: initialDate ?? now,
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2100),
//         );
//         if (picked != null) onChanged(picked);
//         break;

//       case PickerType.dateRange:
//         final picked = await showDateRangePicker(
//           context: context,
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2100),
//           initialDateRange: DateTimeRange(
//             start: initialDate ?? now,
//             end: (initialDate ?? now).add(const Duration(days: 7)),
//           ),
//         );
//         if (picked != null) onChanged(picked.start, picked.end);
//         break;

//       // case PickerType.month:
//       //   picker.DatePicker.showPicker(
//       //     context,
//       //     pickerModel: picker.CustomMonthPicker(
//       //       minTime: DateTime(2000, 1),
//       //       maxTime: DateTime(2100, 12),
//       //       currentTime: initialDate ?? now,
//       //       locale: picker.LocaleType.en,
//       //     ),
//       //     onConfirm: (date) => onChanged(date),
//       //   );
//       //   break;

//       // case PickerType.year:
//       //   picker.DatePicker.showPicker(
//       //     context,
//       //     pickerModel: picker.CustomYearPicker(
//       //       minTime: DateTime(2000),
//       //       maxTime: DateTime(2100),
//       //       currentTime: initialDate ?? now,
//       //       locale: picker.LocaleType.en,
//       //     ),
//       //     onConfirm: (date) => onChanged(date),
//       //   );
//       //   break;

//       case PickerType.quarter:
//         showDialog(
//           context: context,
//           builder: (_) => _QuarterPicker(
//             selected: initialDate ?? now,
//             onSelected: onChanged,
//           ),
//         );
//         break;

//       // case PickerType.week:
//       //   picker.DatePicker.showPicker(
//       //     context,
//       //     pickerModel: picker.WeekPicker(
//       //       minTime: DateTime(2000),
//       //       maxTime: DateTime(2100),
//       //       currentTime: initialDate ?? now,
//       //       locale: picker.LocaleType.en,
//       //     ),
//       //     onConfirm: (date) => onChanged(date),
//       //   );
//       //   break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(
//       onPressed: () => _showPicker(context),
//       child: Text(label),
//     );
//   }
// }


// class _QuarterPicker extends StatelessWidget {
//   final DateTime selected;
//   final void Function(DateTime) onSelected;

//   const _QuarterPicker({
//     required this.selected,
//     required this.onSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     int year = selected.year;

//     return AlertDialog(
//       title: Text('Select Quarter ($year)'),
//       content: Wrap(
//         spacing: 10,
//         children: List.generate(4, (index) {
//           final quarterStart = DateTime(year, index * 3 + 1);
//           return ElevatedButton(
//             onPressed: () {
//               onSelected(quarterStart);
//               Navigator.pop(context);
//             },
//             child: Text('Q${index + 1}'),
//           );
//         }),
//       ),
//     );
//   }
// }
