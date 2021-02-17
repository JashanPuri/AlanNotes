import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class NotesProvider with ChangeNotifier {
  List<Note> _notes = [
    Note(
        id: '1',
        title: 'Note 1',
        note:
            "This is note 1 jndfjndjfnvjmxvnmcxvbmnbmncnb,nc,jxnjvbxvbxnvbx,mcv,cxnv,jbvxb,mvncx,mvbcx,vbx,cbvcxnvbcxmbx",
        date: DateTime.now()),
    Note(
        id: '2', title: 'Note 2', note: "This is note 2", date: DateTime.now()),
    Note(
        id: '3', title: 'Note 3', note: "This is note 3", date: DateTime.now()),
    Note(
        id: '4', title: 'Note 4', note: "This is note 4", date: DateTime.now()),
    Note(id: '5', title: 'Note 5', note: "This is note 5", date: DateTime.now())
  ];

  List<Note> get notes {
    return [..._notes].toList();
  }

  void updateNote({id, title, notes}) {
    
  }

  notifyListeners();
}
