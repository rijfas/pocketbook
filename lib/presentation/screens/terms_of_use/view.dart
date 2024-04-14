import 'package:flutter/material.dart';

class TermsOfUseView extends StatelessWidget {
  const TermsOfUseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'This is a free app developed by Rijfas Usman. By using this app, you agree to the following terms:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '- The app is provided as-is without any warranties. The developer makes no guarantees regarding the accuracy, reliability, or completeness of the information provided by the app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- The developer is not responsible for any damages or losses incurred from the use of this app. Users are advised to use the app for informational purposes only and should not rely solely on it for making financial decisions.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- Users are responsible for their own financial decisions and actions taken based on the information provided by the app. The developer disclaims any liability for the accuracy, completeness, or suitability of the information provided.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- The developer reserves the right to update or modify the app at any time. Users may be required to update the app to continue using it.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- By using the app, you agree to comply with all applicable laws and regulations. Users are prohibited from using the app for any unlawful or unauthorized purpose.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- The developer may collect and use personal information provided by users in accordance with the app\'s Privacy Policy.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                '- These terms may be updated or revised from time to time without notice. It is the user\'s responsibility to review the terms periodically.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'If you do not agree with these terms, please do not use the app.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
