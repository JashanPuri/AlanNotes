import 'dart:convert';

import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
import '../models/models.dart';
import 'package:http/http.dart' as http;

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [];

  List<Note> get notes {
    return [..._notes].toList();
  }

  final String authToken;
  final String userId;
  NotesProvider({this.authToken, this.userId});

  Future<void> createNote(Note note) async {
    final url =
        'https://notes-app-36b3b-default-rtdb.firebaseio.com/notes.json?auth=$authToken';
    try {
      //print('create called');
      final response = await http.post(url,
          body: json.encode({
            'title': note.title,
            'note': note.note,
            'date': note.date.toString(),
          }));
      //print(response.body);
      final newNote = Note(
          date: note.date,
          title: note.title,
          note: note.note,
          id: json.decode(response.body)['name']);
      _notes.add(newNote);
    } catch (error) {
      print(error.toString());
      throw error;
    }
  }

  Future<void> fetchAndSetNotes() async {
    final url =
        'https://notes-app-36b3b-default-rtdb.firebaseio.com/notes.json?auth=$authToken';
    try {
      //print("Called");
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      //print("here");
      List<Note> loadedNotes = [];
      extractedData.forEach((notesId, note) {
        loadedNotes.add(Note(
          id: notesId,
          title: note["title"],
          note: note["note"],
          date: DateTime.parse(note["date"]),
        ));
      });
      _notes = loadedNotes;
    } catch (error) {
      print(error);
      throw error;
    }
    //print(_notes);
    notifyListeners();
  }

  Future<void> updateNote({id, title, notes}) {}

  notifyListeners();
}
