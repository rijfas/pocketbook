import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

class CreateCategoryView extends StatefulWidget {
  @override
  _CreateCategoryPageSView createState() => _CreateCategoryPageSView();
}

class _CreateCategoryPageSView extends State<CreateCategoryView> {
  String selectedEmoji = '📊'; // Default emoji
  TextEditingController titleController = TextEditingController();
  TextEditingController emojiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Emoji:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Center(
              child: GestureDetector(
                onTap: () async {
                  String emoji = await showDialog(
                    context: context,
                    builder: (BuildContext context) => EmojiPicker(
                      textEditingController: emojiController,
                      onEmojiSelected: (category, emoji) {
                        if (emoji != null) {
                          setState(() {
                            selectedEmoji = emoji.emoji;
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      config: Config(
                        height: 256,
                        checkPlatformCompatibility: true,
                        emojiViewConfig: EmojiViewConfig(
                          // Issue: https://github.com/flutter/flutter/issues/28894
                          emojiSizeMax: 28 *
                              (foundation.defaultTargetPlatform ==
                                      TargetPlatform.iOS
                                  ? 1.2
                                  : 1.0),
                        ),
                        swapCategoryAndBottomBar: false,
                        skinToneConfig: const SkinToneConfig(),
                        categoryViewConfig: const CategoryViewConfig(),
                        bottomActionBarConfig: const BottomActionBarConfig(),
                        searchViewConfig: const SearchViewConfig(),
                      ),
                    ),
                  );
                },
                child: Text(
                  selectedEmoji,
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Category Title:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.label),
                labelText: 'Category Title',
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  // Handle category creation logic
                  String categoryTitle = titleController.text;
                  // Use selectedEmoji and categoryTitle for further processing
                },
                child: Text('Create Category'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
