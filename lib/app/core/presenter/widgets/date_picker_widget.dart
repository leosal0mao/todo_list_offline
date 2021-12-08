import 'package:flutter/material.dart';

class DatePickerWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  DatePickerWidget({
    this.initialDate,
    this.firstDate,
    this.lastDate,
  });

  Future<DateTime?> of(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.utc(1989, 11, 9),
      lastDate: lastDate ?? DateTime.utc(2050, 11, 9),
    );
  }
}
