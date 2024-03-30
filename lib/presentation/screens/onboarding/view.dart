import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbook/utils/assets.dart';
import 'package:pocketbook/utils/routes.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  String _name = '';
  String _currency = 'USD';
  bool _enableAutoUPI = false;
  List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'INR',
    'JPY'
  ]; // Example currencies

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 36),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: SvgPicture.asset(
                Assets.onboardingImage,
              ),
            ),
            SizedBox(height: 36),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _name = value;
                });
              },
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: _currency,
              onChanged: (value) {
                setState(() {
                  _currency = value!;
                });
              },
              items: _currencies.map((currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Preferred Currency',
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.account_balance_wallet),
                SizedBox(width: 10),
                Text('Enable Auto UPI Transactions:'),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Switch(
                      value: _enableAutoUPI,
                      onChanged: (value) {
                        setState(() {
                          _enableAutoUPI = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: Colors.grey[300],
                          size: 12,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Needs SMS Permission',
                          style:
                              TextStyle(color: Colors.grey[300], fontSize: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 36),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.dashboard);
              },
              child: Text('Save Preferences'),
            ),
          ],
        ),
      ),
    );
  }
}
