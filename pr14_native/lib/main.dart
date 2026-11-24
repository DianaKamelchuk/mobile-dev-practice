import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native features',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // канал для зв'язку з нативним кодом (назва збігається з Kotlin)
  static const _channel = MethodChannel('com.example.pr14_native/native');

  final _picker = ImagePicker();

  String? _time;
  File? _photo;

  // виклик нативного коду: отримуємо час у форматі HH:MM:SS
  Future<void> _getNativeTime() async {
    try {
      final time = await _channel.invokeMethod<String>('getCurrentTime');
      if (!mounted) return;
      setState(() => _time = time);
    } on PlatformException catch (e) {
      if (!mounted) return;
      setState(() => _time = 'Error: ${e.message}');
    }
  }

  // фото з камери
  Future<void> _takePhoto() async {
    final image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    if (!mounted) return;
    setState(() => _photo = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _getNativeTime,
              child: const Text('Get native time'),
            ),
            const SizedBox(height: 12),
            Text(
              _time ?? '--:--:--',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Take photo'),
            ),
            const SizedBox(height: 16),
            if (_photo != null)
              Image.file(_photo!, height: 300, fit: BoxFit.contain)
            else
              const Text(
                'No photo yet',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}