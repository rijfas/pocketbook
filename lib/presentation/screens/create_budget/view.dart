import 'package:flutter/material.dart';
import 'package:pocketbook/presentation/screens/create_budget/controller.dart';
import 'package:pocketbook/presentation/screens/create_budget/widgets/category_amount_list.dart';
import 'package:provider/provider.dart';
import '../../widgets/date_picker_form_field.dart';

class CreateBudgetView extends StatefulWidget {
  const CreateBudgetView({super.key});

  @override
  State<CreateBudgetView> createState() => _CreateBudgetViewState();
}

class _CreateBudgetViewState extends State<CreateBudgetView> {
  @override
  void initState() {
    _startDate = today;
    _endDate = today.add(const Duration(days: 30));
    super.initState();
  }

  final today = DateTime.now();
  late DateTime _startDate;
  late DateTime _endDate;
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Budget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty || value == '0') {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                controller: _amountController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.currency_rupee),
                  labelText: 'Budget',
                ),
              ),
              const SizedBox(height: 16),
              DatePickerFormField(
                validator: (date) =>
                    date == null ? 'Please select a date' : null,
                onDatePicked: (value) {
                  if (value != null) {
                    setState(() {
                      _startDate = value;
                    });
                  }
                },
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
                initialDate: _startDate,
                labelText: 'Start Date',
              ),
              const SizedBox(height: 16),
              DatePickerFormField(
                validator: (date) => date == null
                    ? 'Please select a date'
                    : (date.isBefore(_startDate))
                        ? 'Please select a valid date'
                        : null,
                onDatePicked: (value) {
                  if (value != null) {
                    setState(() {
                      _endDate = value;
                    });
                  }
                },
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
                initialDate: _endDate,
                labelText: 'End Date',
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Text('Categories'),
                ],
              ),
              const Divider(),
              const Expanded(
                child: CategoryAmountList(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<CreateBudgetController>()
                        .createBudget(
                          amount:
                              double.tryParse(_amountController.text) ?? 0.0,
                          startDate: _startDate,
                          endDate: _endDate,
                        )
                        .then(
                          Navigator.of(context).pop,
                        );
                  }
                },
                child: const SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text('Save'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
