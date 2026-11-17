import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'preview_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _textController = TextEditingController();
  final _sizeController = TextEditingController(text: '24');

  String? _textError;
  String? _sizeError;

  @override
  void dispose() {
    _textController.dispose();
    _sizeController.dispose();
    super.dispose();
  }

  // перевірка введених значень, повертає true, якщо все гаразд
  bool _validate() {
    final text = _textController.text.trim();
    final size = int.tryParse(_sizeController.text);

    setState(() {
      _textError = text.isEmpty ? 'Enter some text' : null;
      _sizeError =
      (size == null || size < 1 || size > 200) ? 'Enter a number from 1 to 200' : null;
    });

    return _textError == null && _sizeError == null;
  }

  Future<void> _openPreview() async {
    if (!_validate()) return;

    final fontSize = double.parse(_sizeController.text);

    // чекаємо результат з другого екрана: true (Ok), false (Cancel) або null
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          text: _textController.text,
          fontSize: fontSize,
        ),
      ),
    );

    if (!mounted) return;

    String message;
    if (result == true) {
      message = 'Cool!';
    } else if (result == false) {
      message = "Let's try something else.";
    } else {
      message = "Don't know what to say.";
    }

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text(message),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Enter text'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text',
                border: const OutlineInputBorder(),
                errorText: _textError,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _sizeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: 'Size',
                border: const OutlineInputBorder(),
                errorText: _sizeError,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _openPreview,
                child: const Text('Preview'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}