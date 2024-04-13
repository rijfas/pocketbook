import 'package:flutter/material.dart' hide Notification;
import 'package:intl/intl.dart';
import 'package:pocketbook/models/notification.dart';
import 'package:pocketbook/presentation/screens/dashboard/widgets/add_expense_sheet.dart';
import 'package:pocketbook/presentation/screens/notifications/controller.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.select<NotificationsController, List<Notification>>(
      (controller) => controller.notifications,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Swip left to delete notifications'),
                ),
              );
            },
            icon: Icon(Icons.question_mark),
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: notifications.length,
        itemBuilder: (context, index) => Dismissible(
          key: Key(notifications[index].id.toString()),
          onDismissed: (direction) => context
              .read<NotificationsController>()
              .removeNotification(notifications[index])
              .then((_) => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notification Deleted'),
                    ),
                  )),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.wallet),
            ),
            title: Text(
              'New transaction of ${NumberFormat.simpleCurrency(locale: 'en_IN').format(notifications[index].amount)}',
            ),
            subtitle: Text(
              '${DateFormat.yMd().format(notifications[index].createdAt)} ${DateFormat.Hm().format(notifications[index].createdAt)}',
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet<bool?>(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => AddExpenseSheet(
                      amount: notifications[index].amount,
                    ),
                  ).then(
                    (isAdded) {
                      if (isAdded ?? false) {
                        context
                            .read<NotificationsController>()
                            .removeNotification(notifications[index]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Transaction Saved'),
                          ),
                        );
                      }
                    },
                  );
                },
                icon: const Icon(Icons.save),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
