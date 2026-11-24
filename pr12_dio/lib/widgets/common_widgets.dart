import 'package:flutter/material.dart';

// Поле вводу з жирним підписом зверху та валідацією
class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.obscure = false,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          validator: validator,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

// Діалог з результатом запиту
void showMessage(BuildContext context, String title, String text) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

// Індикатор завантаження для кнопок
class ButtonLoader extends StatelessWidget {
  const ButtonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
    );
  }
}