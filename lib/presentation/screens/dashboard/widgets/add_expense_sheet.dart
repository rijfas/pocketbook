import 'package:flutter/material.dart';
import '../../../../models/category.dart';
import '../../../../models/transaction.dart';
import '../../../widgets/date_picker_form_field.dart';
import 'select_category_sheet/select_category_sheet.dart';
import '../../../../services/transaction_service.dart';
import 'package:provider/provider.dart';

class AddExpenseSheet extends StatefulWidget {
  const AddExpenseSheet({super.key});

  @override
  State<AddExpenseSheet> createState() => _AddExpenseSheetState();
}

class _AddExpenseSheetState extends State<AddExpenseSheet> {
  final _expenseNameController = TextEditingController();
  final _amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  Category? _selectedCategory;

  @override
  void dispose() {
    _expenseNameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => SingleChildScrollView(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add Expense',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an amount';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.currency_rupee),
                    labelText: 'Amount',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _expenseNameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.label),
                    labelText: 'Expense Name (Optional)',
                  ),
                ),
                const SizedBox(height: 16),
                DatePickerFormField(
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2050),
                  initialDate: _selectedDate,
                  validator: (date) =>
                      date == null ? 'Please select a date' : null,
                  onDatePicked: (date) {
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }
                  },
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Text('Category'),
                  ],
                ),
                const SizedBox(height: 8),
                (_selectedCategory == null)
                    ? TextButton.icon(
                        onPressed: () async {
                          final category = await showModalBottomSheet<Category>(
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => const SelectCategorySheet(),
                          );
                          if (category != null) {
                            setState(() {
                              _selectedCategory = category;
                            });
                          }
                        },
                        icon: Icon(Icons.add),
                        label: Text('Select'),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(_selectedCategory!.emoji),
                          ),
                          title: Text(_selectedCategory!.name),
                          trailing: IconButton(
                            onPressed: () => setState(() {
                              _selectedCategory = null;
                            }),
                            icon: Icon(Icons.close),
                          ),
                        ),
                      ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final transaction = Transaction()
                          ..name = _expenseNameController.text
                          ..amount = double.parse(_amountController.text)
                          ..category = _selectedCategory!.toString();
                        context
                            .read<TransactionService>()
                            .addTranasction(transaction)
                            .then((_) => Navigator.of(context).pop());
                        ;
                      }
                    },
                    child: Text('Add'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
