import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerField extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;
  final bool hasError;
  final void Function(DateTime?) onDatePicked;
  final String? errorText;

  const DatePickerField({
    Key? key,
    required this.firstDate,
    required this.lastDate,
    required this.initialDate,
    required this.onDatePicked,
    this.errorText,
  })  : hasError = errorText != null,
        super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  DateTime? _selectedDate;

  @override
  void initState() {
    _selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        final selectedDate = await showDatePicker(
          context: context,
          firstDate: widget.firstDate,
          lastDate: widget.lastDate,
          initialDate: _selectedDate,
        );
        setState(() {
          _selectedDate = selectedDate;
        });
        widget.onDatePicked(selectedDate);
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        icon: Icon(Icons.date_range),
        labelText: 'Date',
      ),
      controller: _selectedDate != null
          ? TextEditingController(
              text: DateFormat.yMMMEd().format(_selectedDate!))
          : TextEditingController(text: "Select a date"),
    );
  }
}
