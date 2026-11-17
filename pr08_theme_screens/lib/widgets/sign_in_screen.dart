import 'package:flutter/material.dart';
import 'common_widgets.dart';
import 'reset_password_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const FlutterLogo(size: 120, style: FlutterLogoStyle.horizontal),
                const SizedBox(height: 16),
                const LabeledField(label: 'Email:'),
                const LabeledField(label: 'Password:', obscure: true),
                const SizedBox(height: 4),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign up'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => showNeedToImplement(context),
                        child: const Text('Login'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text('Reset password'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}