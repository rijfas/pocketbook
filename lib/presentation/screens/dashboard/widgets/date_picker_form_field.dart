import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/dashboard/widgets/date_picker_field.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    Key? key,
    required FormFieldValidator<DateTime> validator,
    required void Function(DateTime?) onDatePicked,
    required DateTime firstDate,
    required DateTime lastDate,
    required DateTime initialDate,
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
            );
          },
        );
}
