class Note {
  final int? id;
  final String text;
  final DateTime createdAt;

  const Note({this.id, required this.text, required this.createdAt});

  // для запису в БД (id створюється базою автоматично)
  Map<String, Object?> toMap() {
    return {
      'text': text,
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  // для читання з БД
  factory Note.fromMap(Map<String, Object?> map) {
    return Note(
      id: map['id'] as int,
      text: map['text'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at'] as int),
    );
  }

  // дата у форматі dd.MM.yyyy HH:mm
  String get formattedDate {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(createdAt.day)}.${two(createdAt.month)}.${createdAt.year} '
        '${two(createdAt.hour)}:${two(createdAt.minute)}';
  }
}