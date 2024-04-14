import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pocketbook/presentation/screens/onboarding/controller.dart';
import 'package:pocketbook/utils/assets.dart';
import 'package:pocketbook/utils/routes.dart';
import 'package:pocketbook/utils/show_alert_dialog.dart';
import 'package:pocketbook/utils/sms_manager.dart';
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Lottie.asset(
                  Assets.onboardingAnimation,
                ),
              ),
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
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
                textInputAction: TextInputAction.done,
                validator: (value) => value == null || !isEmail(value)
                    ? 'Enter a valid email'
                    : null,
                keyboardType: TextInputType.emailAddress,
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
                    SmsManager.requestSmsPermission().then(
                      (hasPermission) async {
                        if (hasPermission) {
                          setState(() {
                            _smsTrackingEnabled = value;
                          });
                        } else {
                          await showAlertDialog(
                            context,
                            title: 'Allow sms permission',
                            description:
                                'Sms permission is required to auto track sms',
                          );
                        }
                      },
                    );
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
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            Routes.dashboard,
                            (_) => false,
                          );
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
