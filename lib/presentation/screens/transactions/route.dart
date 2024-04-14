import 'package:flutter/material.dart';
import 'controller.dart';
import '../../../services/transaction_service.dart';
import 'package:provider/provider.dart';

import 'view.dart';

class Transactions extends MaterialPageRoute {
  Transactions({Key? key})
      : super(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => TransactionsController(
              context.read<TransactionService>(),
            )..load(),
            child: const TransactionsView(),
          ),
        );
}
