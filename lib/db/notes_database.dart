import 'dart:convert';

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:todolist/constant/constant.dart';
import 'package:todolist/model/note.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  NotesDatabase._init();

  // Future<Database> get database async {
  //   if (_database != null) return _database!;

  //   _database = await _initDB("notes.db");
  //   return _database!;
  // }

  // Future<Database> _initDB(String filePath) async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, filePath);

  //   return await openDatabase(path, version: 1, onCreate: _createDB);
  // }

  // Future _createDB(Database db, int version) async {
  //   await db.execute(
  //       'CREATE TABLE $tableNotes(${NoteFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, ${NoteFields.description} TEXT)');
  // }

  Future<Note> create(Note note) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(note.toJson()),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Note.fromJson(jsonResponse);
    } else {
      throw Exception("Failed to create note");
    }
  }

  Future<Note> readNote(int id) async {
    final response = await http.get(Uri.parse('$readNotes/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return Note.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to read note');
    }
  }

  Future<List<Note>> readAllNotes() async {
    final response = await http.get(Uri.parse(readAllNote));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body) as List;
      return jsonResponse.map((note) => Note.fromJson(note)).toList();
    } else {
      throw Exception("Failed to load Notes");
    }
  }

  Future<int> update(Note note) async {
    final response = await http.put(
      Uri.parse('$updateNotes/${note.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(note.toJson()),
    );
    if (response.statusCode == 200) {
      return note.id!;
    } else {
      throw Exception('Failed to update note');
    }
  }

  Future<int> delete(int id) async {
    final response = await http.delete(Uri.parse('$deleteNotes/$id'));
    if (response.statusCode == 200) {
      return id;
    } else {
      throw Exception('Failed to delete note');
    }
  }

  // Future close() async {
  //   final db = await instance.database;
  //   db.close();
  // }
}
