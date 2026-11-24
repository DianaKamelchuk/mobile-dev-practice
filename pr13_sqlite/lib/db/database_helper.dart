import 'package:sqflite/sqflite.dart';
import '../models/note.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Future<Database> get database async {
    _database ??= await _open();
    return _database!;
  }

  Future<Database> _open() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      '$dbPath/notes.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes('
              'id INTEGER PRIMARY KEY AUTOINCREMENT, '
              'text TEXT NOT NULL, '
              'created_at INTEGER NOT NULL)',
        );
      },
    );
  }

  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert('notes', note.toMap());
  }

  // LIFO: остання додана нотатка (найбільший id) іде першою
  Future<List<Note>> getNotes() async {
    final db = await database;
    final rows = await db.query('notes', orderBy: 'id DESC');
    return rows.map(Note.fromMap).toList();
  }
}