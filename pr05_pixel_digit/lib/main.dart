import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// параметри "пікселя" згідно з варіантом 6
const _size = 25.0;
const _bgColor = Colors.green;
const _borderColor = Colors.grey;
const _borderWidth = 3.0;
const _borderRadius = 4.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Expanded займає всю вільну висоту, цифра по центру
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _buildSix(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // цифра 6: # - піксель, . - порожнє місце
  List<Widget> _buildSix() {
    return [
      _buildLine('.##.'),
      _buildLine('#...'),
      _buildLine('###.'),
      _buildLine('#..#'),
      _buildLine('#..#'),
      _buildLine('.##.'),
    ];
  }

  Widget _buildLine(String pattern) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final symbol in pattern.split(''))
          symbol == '#' ? _buildDot() : _buildEmpty(),
      ],
    );
  }

  Widget _buildDot() {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(_borderRadius)),
        border: Border.all(color: _borderColor, width: _borderWidth),
      ),
    );
  }

  Widget _buildEmpty() {
    return const SizedBox(width: _size, height: _size);
  }
}