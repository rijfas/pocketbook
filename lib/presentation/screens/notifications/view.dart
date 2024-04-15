import 'package:flutter/material.dart' hide Notification;
import 'package:intl/intl.dart';
import 'package:pocketbook/models/notification.dart';
import 'package:pocketbook/presentation/screens/dashboard/widgets/add_expense_sheet.dart';
import 'package:pocketbook/presentation/screens/notifications/controller.dart';
import 'package:pocketbook/presentation/widgets/empty_widget.dart';
import 'package:provider/provider.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications =
        context.select<NotificationsController, List<Notification>>(
      (controller) => controller.notifications,
    );

    final isLoading = context.select<NotificationsController, bool>(
        (controller) => controller.isLoading);

    final isEmpty = context.select<NotificationsController, bool>(
        (controller) => controller.isEmpty);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Swip left to delete notifications'),
                ),
              );
            },
            icon: const Icon(Icons.question_mark),
          )
        ],
      ),
      body: (isLoading)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (isEmpty)
              ? const Center(
                  child: EmptyWidget(message: 'No new notifications found'),
                )
              : ListView.separated(
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
