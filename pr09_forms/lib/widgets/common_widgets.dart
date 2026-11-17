import 'package:flutter/material.dart';

// Поле вводу з жирним підписом зверху та валідацією
class LabeledField extends StatelessWidget {
  const LabeledField({
    super.key,
    required this.label,
    required this.validator,
    this.obscure = false,
  });

  final String label;
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
          obscureText: obscure,
          validator: validator,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

// Діалог-заглушка, коли дані пройшли перевірку
void showNeedToImplement(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return const AlertDialog(
        title: Text('Message'),
        content: Text('Need to implement'),
      );
    },
  );
}