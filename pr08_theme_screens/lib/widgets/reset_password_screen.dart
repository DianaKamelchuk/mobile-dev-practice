import 'package:flutter/material.dart';
import 'common_widgets.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                const SizedBox(height: 8),
                const Text(
                  'Reset password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const LabeledField(label: 'Email:'),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => showNeedToImplement(context),
                    child: const Text('Reset'),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}