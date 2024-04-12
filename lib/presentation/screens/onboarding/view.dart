import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pocketbook/presentation/screens/onboarding/controller.dart';
import 'package:pocketbook/utils/assets.dart';
import 'package:pocketbook/utils/routes.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class OnboardingView extends StatefulWidget {
  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _smsTrackingEnabled = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 8.0,
        ),
        child: Form(
          key: _formKey,
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
                autofocus: true,
                controller: _userNameController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter a name' : null,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                validator: (value) => value == null || !isEmail(value)
                    ? 'Enter a valid email'
                    : null,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.sms),
                ),
                title: const Text(
                  'SMS Tracking',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: const Text(
                  'automatically add transactions based on incoming sms',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                trailing: Switch(
                  value: _smsTrackingEnabled,
                  onChanged: (value) {
                    setState(() {
                      _smsTrackingEnabled = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 36),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<OnboardingController>()
                        .savePreferences(
                          userName: _userNameController.text,
                          email: _emailController.text,
                          smsTrackingEnabled: _smsTrackingEnabled,
                        )
                        .then(
                      (saved) {
                        if (saved) {
                          Navigator.of(context).pushNamed(Routes.dashboard);
                        }
                      },
                    );
                  }
                },
                child: Text('Save Preferences'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
