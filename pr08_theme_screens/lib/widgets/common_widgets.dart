import 'package:flutter/material.dart';

// Поле вводу з жирним підписом зверху
class LabeledField extends StatelessWidget {
  const LabeledField({super.key, required this.label, this.obscure = false});

  final String label;
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
        TextField(obscureText: obscure),
        const SizedBox(height: 12),
      ],
    );
  }
}

// Діалог-заглушка для кнопок дій
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