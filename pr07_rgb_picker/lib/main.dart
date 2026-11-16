import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RGB Picker',
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
  double _red = 128;
  double _green = 128;
  double _blue = 128;

  @override
  Widget build(BuildContext context) {
    final color = Color.fromARGB(255, _red.round(), _green.round(), _blue.round());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: 200,
                height: 200,
                color: color,
              ),
            ),
            const SizedBox(height: 48),
            ColorSlider(
              label: 'Red',
              value: _red,
              onChanged: (v) => setState(() => _red = v),
            ),
            ColorSlider(
              label: 'Green',
              value: _green,
              onChanged: (v) => setState(() => _green = v),
            ),
            ColorSlider(
              label: 'Blue',
              value: _blue,
              onChanged: (v) => setState(() => _blue = v),
            ),
          ],
        ),
      ),
    );
  }
}

// Stateless-віджет: сам нічого не зберігає, лише показує значення,
// яке йому передали, і повідомляє про зміну через onChanged
class ColorSlider extends StatelessWidget {
  const ColorSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: '$label: ',
            children: [
              TextSpan(
                text: '${value.round()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Slider(
          value: value,
          min: 0,
          max: 255,
          onChanged: onChanged,
        ),
      ],
    );
  }
}