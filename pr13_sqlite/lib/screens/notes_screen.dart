import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import '../models/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key, required this.title});

  final String title;

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  final _db = DatabaseHelper.instance;

  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    // при запуску завантажуємо раніше збережені нотатки
    _loadNotes();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadNotes() async {
    final notes = await _db.getNotes();
    if (!mounted) return;
    setState(() => _notes = notes);
  }

  Future<void> _addNote() async {
    if (!_formKey.currentState!.validate()) return;

    final note = Note(
      text: _controller.text.trim(),
      createdAt: DateTime.now(),
    );
    await _db.insertNote(note);

    // очищаємо поле разом із повідомленням про помилку
    _formKey.currentState!.reset();
    await _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Value is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 56,
                    child: FilledButton(
                      onPressed: _addNote,
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: _notes.isEmpty
                ? const Center(child: Text('No notes yet'))
                : ListView.separated(
              itemCount: _notes.length,
              separatorBuilder: (context, index) =>
              const Divider(height: 1),
              itemBuilder: (context, index) {
                final note = _notes[index];
                return ListTile(
                  title: Text(note.text),
                  subtitle: Text(note.formattedDate),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}