import 'package:flutter/material.dart';

class FaqView extends StatelessWidget {
  FaqView({super.key});

  final List<Map<String, String>> faqData = [
    {
      'question': 'What is an AI finance tracker?',
      'answer':
          'An AI finance tracker is a mobile application that utilizes artificial intelligence technology to help users manage their finances more efficiently.'
    },
    {
      'question': 'How does auto SMS tracking work?',
      'answer':
          'Auto SMS tracking is a feature that automatically detects and categorizes financial transactions from SMS messages received on your phone. The AI analyzes the message content to identify transactions and assigns them to appropriate categories.'
    },
    {
      'question': 'What are categories?',
      'answer':
          'Categories are predefined groups that you can assign your transactions to, such as groceries, utilities, entertainment, etc. They help you organize and understand your spending habits.'
    },
    {
      'question': 'How can I create a budget?',
      'answer':
          'You can create a budget by setting limits on how much you want to spend within specific categories or overall. The app will track your spending and notify you when you\'re approaching or exceeding your budget.'
    },
    {
      'question': 'Can I customize categories and budgets?',
      'answer':
          'Yes, you can customize categories and budgets to fit your specific financial needs and goals. You can create new categories, edit existing ones, and adjust budget limits as needed.'
    },
    {
      'question': 'Is my financial data secure?',
      'answer':
          'Yes, your financial data is securely stored and protected by encryption. We prioritize the privacy and security of your information and adhere to strict data protection measures.'
    },
    {
      'question': 'Does the app support multiple currencies?',
      'answer':
          'Yes, the app supports multiple currencies, allowing you to track expenses and budgets in different currencies if needed.'
    },
    {
      'question': 'Can I sync my data across multiple devices?',
      'answer':
          'Yes, you can sync your data across multiple devices by signing in with the same account. Your data will be securely stored in the cloud and accessible from any device.'
    },
    {
      'question': 'Is the app available on both Android and iOS?',
      'answer':
          'Yes, the app is available on both Android and iOS platforms, providing a seamless experience across different devices.'
    },
    {
      'question': 'How often does the app update transaction data?',
      'answer':
          'The app updates transaction data in real-time or at regular intervals, depending on your preferences and settings. You can also manually refresh the data whenever needed.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: ListView.builder(
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          final question = faqData[index]['question'];
          final answer = faqData[index]['answer'];
          return ExpansionTile(
            title: Text(question!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(answer!),
              ),
            ],
          );
        },
      ),
    );
  }
}
