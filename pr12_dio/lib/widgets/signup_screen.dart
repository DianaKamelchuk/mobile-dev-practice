import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../utils/validators.dart';
import 'common_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _api = ApiService();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await _api.signUp(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text,
      );
      if (!mounted) return;
      showMessage(context, 'Success', 'Sign up data was sent');
    } on DioException catch (e) {
      if (!mounted) return;
      showMessage(context, 'Error', e.message ?? 'Request failed');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(
                    size: 120,
                    style: FlutterLogoStyle.horizontal,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  LabeledField(
                    label: 'Name:',
                    controller: _nameController,
                    validator: Validators.required,
                  ),
                  LabeledField(
                    label: 'Email:',
                    controller: _emailController,
                    validator: Validators.email,
                  ),
                  LabeledField(
                    label: 'Password:',
                    controller: _passwordController,
                    obscure: true,
                    validator: Validators.password,
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _signUp,
                      child: _isLoading
                          ? const ButtonLoader()
                          : const Text('Sign up'),
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
      ),
    );
  }
}