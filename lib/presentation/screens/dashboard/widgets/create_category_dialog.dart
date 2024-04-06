import 'package:emoji_picker_flutter/emoji_picker_flutter.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/services/category_service.dart';
import 'package:provider/provider.dart';

class CreateCategoryDialog extends StatefulWidget {
  const CreateCategoryDialog({
    super.key,
  });

  @override
  State<CreateCategoryDialog> createState() => _CreateCategoryDialogState();
}

class _CreateCategoryDialogState extends State<CreateCategoryDialog> {
  final _formKey = GlobalKey<FormState>();
  String _selectedEmoji = '📊';

  final TextEditingController emojiController =
      TextEditingController(text: '📊');

  final TextEditingController titleController = TextEditingController();

  @override
  void dispose() {
    emojiController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 8),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Create Category',
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
              const Divider(),
              const SizedBox(height: 8),
              const Text(
                'Choose Emoji:',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: GestureDetector(
                  onTap: () async {
                    final emoji = await showDialog<Emoji>(
                      context: context,
                      builder: (BuildContext context) => EmojiPicker(
                        textEditingController: emojiController,
                        onEmojiSelected: (category, emoji) {
                          Navigator.of(context).pop(emoji);
                        },
                        config: const Config(
                          height: 256,
                          checkPlatformCompatibility: true,
                          emojiViewConfig: EmojiViewConfig(
                            emojiSizeMax: 28,
                          ),
                          swapCategoryAndBottomBar: false,
                          skinToneConfig: SkinToneConfig(),
                          categoryViewConfig: CategoryViewConfig(),
                          bottomActionBarConfig: BottomActionBarConfig(),
                          searchViewConfig: SearchViewConfig(),
                        ),
                      ),
                    );
                    if (emoji != null) {
                      setState(() {
                        _selectedEmoji = emoji.emoji;
                      });
                    }
                  },
                  child: Text(
                    _selectedEmoji,
                    style: const TextStyle(fontSize: 36),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Category Title:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category title';
                  }
                  return null;
                },
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.label),
                  labelText: 'Category Title',
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final category = Category()
                ..name = titleController.text
                ..emoji = _selectedEmoji;
              context.read<CategoryService>().putCategory(category);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Save'),
        ),
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
