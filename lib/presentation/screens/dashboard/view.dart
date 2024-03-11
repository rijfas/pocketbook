import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/routes.dart';
import 'pages/pages.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _showCategoryBottomSheet(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<String> allCategories = [
      "Food",
      "Shopping",
      "Entertainment",
      "Utilities",
      "Others"
    ];
    List<String> filteredCategories = List.from(allCategories);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              padding: MediaQuery.of(context).viewInsets,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Category',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 8),
                    TextField(
                      controller: searchController,
                      autofocus: true,
                      onChanged: (query) {
                        setState(() {
                          filteredCategories = allCategories
                              .where((category) => category
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(),
                        labelText: 'Search Category',
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8.0,
                      children: filteredCategories.map((category) {
                        return ActionChip(
                          label: Text(category),
                          onPressed: () {
                            // Handle the selected category
                            Navigator.of(context).pop(category);
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  final _pages = const [
    HomePage(),
    TransactionsPage(),
    BudgetsPage(),
    SmartAdvisorPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('PocketBook'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed(Routes.settings),
            icon: CircleAvatar(
              child: Text('RI'),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (int index) => setState(() {
                _index = index;
              }),
          destinations: [
            NavigationDestination(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: 'Transactions',
              icon: Icon(Icons.compare_arrows_rounded),
            ),
            NavigationDestination(
              label: 'Budgets',
              icon: Icon(Icons.work),
            ),
            NavigationDestination(
              label: 'Smart Advisor',
              icon: Icon(Icons.chat),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => BottomSheet(
              onClosing: () {},
              builder: (_) => SingleChildScrollView(
                padding: MediaQuery.of(context).viewInsets,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Expense',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Icon(Icons.close),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.label),
                          labelText: 'Expense Name',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.currency_rupee),
                          labelText: 'Amount',
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.date_range),
                          labelText: 'Date',
                        ),
                        controller: selectedDate != null
                            ? TextEditingController(text: "${selectedDate}")
                            : TextEditingController(),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text('Category'),
                        ],
                      ),
                      SizedBox(height: 8),
                      TextButton.icon(
                        // onPressed: () {
                        //   String selectedEmoji = '📊'; // Default emoji
                        //   TextEditingController titleController =
                        //       TextEditingController();
                        //   TextEditingController emojiController =
                        //       TextEditingController();

                        //   showModalBottomSheet(
                        //     context: context,
                        //     isScrollControlled: true,
                        //     builder: (_) => BottomSheet(
                        //       onClosing: () {},
                        //       builder: (_) => SingleChildScrollView(
                        //         padding: MediaQuery.of(context).viewInsets,
                        //         child: Padding(
                        //           padding: EdgeInsets.symmetric(
                        //             vertical: 8.0,
                        //             horizontal: 16.0,
                        //           ),
                        //           child: Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: [
                        //               Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text(
                        //                     'Create Category',
                        //                     style: TextStyle(
                        //                       fontSize: 18,
                        //                       fontWeight: FontWeight.bold,
                        //                     ),
                        //                   ),
                        //                   IconButton(
                        //                     onPressed: () =>
                        //                         Navigator.of(context).pop(),
                        //                     icon: Icon(Icons.close),
                        //                   )
                        //                 ],
                        //               ),
                        //               Divider(),
                        //               SizedBox(height: 8),
                        //               Text(
                        //                 'Choose Emoji:',
                        //                 style: TextStyle(
                        //                   fontSize: 14,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //               ),
                        //               SizedBox(height: 8),
                        //               Center(
                        //                 child: GestureDetector(
                        //                   onTap: () async {
                        //                     String emoji = await showDialog(
                        //                       context: context,
                        //                       builder: (BuildContext context) =>
                        //                           EmojiPicker(
                        //                         textEditingController:
                        //                             emojiController,
                        //                         onEmojiSelected:
                        //                             (category, emoji) {
                        //                           if (emoji != null) {
                        //                             setState(() {
                        //                               selectedEmoji =
                        //                                   emoji.emoji;
                        //                             });
                        //                           }
                        //                           Navigator.of(context).pop();
                        //                         },
                        //                         config: Config(
                        //                           height: 256,
                        //                           checkPlatformCompatibility:
                        //                               true,
                        //                           emojiViewConfig:
                        //                               EmojiViewConfig(
                        //                             // Issue: https://github.com/flutter/flutter/issues/28894
                        //                             emojiSizeMax: 28 *
                        //                                 (foundation.defaultTargetPlatform ==
                        //                                         TargetPlatform
                        //                                             .iOS
                        //                                     ? 1.2
                        //                                     : 1.0),
                        //                           ),
                        //                           swapCategoryAndBottomBar:
                        //                               false,
                        //                           skinToneConfig:
                        //                               const SkinToneConfig(),
                        //                           categoryViewConfig:
                        //                               const CategoryViewConfig(),
                        //                           bottomActionBarConfig:
                        //                               const BottomActionBarConfig(),
                        //                           searchViewConfig:
                        //                               const SearchViewConfig(),
                        //                         ),
                        //                       ),
                        //                     );
                        //                   },
                        //                   child: Text(
                        //                     selectedEmoji,
                        //                     style: TextStyle(fontSize: 36),
                        //                   ),
                        //                 ),
                        //               ),
                        //               SizedBox(height: 16),
                        //               Text(
                        //                 'Category Title:',
                        //                 style: TextStyle(
                        //                     fontSize: 14,
                        //                     fontWeight: FontWeight.bold),
                        //               ),
                        //               SizedBox(height: 8),
                        //               TextField(
                        //                 autofocus: true,
                        //                 controller: titleController,
                        //                 decoration: InputDecoration(
                        //                   border: OutlineInputBorder(),
                        //                   icon: Icon(Icons.label),
                        //                   labelText: 'Category Title',
                        //                 ),
                        //               ),
                        //               SizedBox(height: 16),
                        //               SizedBox(
                        //                 width: double.infinity,
                        //                 child: FilledButton(
                        //                   onPressed: () {
                        //                     // Handle category creation logic
                        //                     String categoryTitle =
                        //                         titleController.text;
                        //                     // Use selectedEmoji and categoryTitle for further processing
                        //                   },
                        //                   child: Text('Create Category'),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   );
                        // },
                        onPressed: () => _showCategoryBottomSheet(context),
                        icon: Icon(Icons.add),
                        label: Text('Select'),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {},
                          child: Text('Add'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
