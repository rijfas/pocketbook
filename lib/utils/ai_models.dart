import 'dart:typed_data';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:pocketbook/models/category.dart';
import 'package:pocketbook/models/transaction.dart';
import 'package:pocketbook/utils/secrets.dart';

sealed class AiModels {
  static GenerativeModel chatModel(List<Transaction> transactions) {
    return GenerativeModel(
      model: 'gemini-1.5-pro-latest',
      apiKey: Secrets.apiKey,
      requestOptions: const RequestOptions(apiVersion: 'v1beta'),
      systemInstruction: Content.system(
          'You are a personal financial assistant bot, Do not respond to quries that are not related to financial assistance, Respond with no formatting, Include emojis, the user\'s transactions are: $transactions'),
    );
  }

  static Future<Transaction?> detectTransactionFromBillImage(
      Uint8List image, List<Category> categories) async {
    final model = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: Secrets.apiKey,
    );

    final content = [
      Content.multi([
        TextPart(
          'Detect total bill amount,category from given bill image, Category should be any of $categories, return the response in the format amount followed by a comma followed by category emoji followed by space followed by category name',
        ),
        DataPart('image/png', image),
      ])
    ];

    final response = await model.generateContent(content);

    try {
      final data = response.text!.split(',');
      final amount = double.tryParse(data[0]) ?? 0;
      final category = data[1].trim();
      final transaction = Transaction()
        ..amount = amount
        ..category = category
        ..name = '';
      return transaction;
    } catch (e) {
      return null;
    }
  }
}
