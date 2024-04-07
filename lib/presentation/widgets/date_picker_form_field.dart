import 'package:flutter/material.dart';
import 'date_picker_field.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    Key? key,
    required FormFieldValidator<DateTime> validator,
    required void Function(DateTime?) onDatePicked,
    required DateTime firstDate,
    required DateTime lastDate,
    required DateTime initialDate,
    String? labelText,
  }) : super(
          key: key,
          initialValue: initialDate,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<DateTime> state) {
            return DatePickerField(
              firstDate: firstDate,
              lastDate: lastDate,
              initialDate: initialDate,
              onDatePicked: (date) {
                state.didChange(date);
                onDatePicked(date);
              },
              errorText: state.errorText,
              labelText: labelText,
            );
          },
        );
}
