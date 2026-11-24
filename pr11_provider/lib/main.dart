import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/corners_model.dart';
import 'widgets/corners_section.dart';

void main() {
  runApp(
    // Provider створює модель один раз і робить її доступною для всього додатку
    ChangeNotifierProvider(
      create: (context) => CornersModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corners Configurator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Center(child: CornersSection()),
      ),
    );
  }
}