import 'package:alan_notes_app/constants.dart';
import 'package:alan_notes_app/models/models.dart';
import 'package:alan_notes_app/providers/notes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditNotes extends StatefulWidget {
  static const routeName = '/edit-notes';
  final title;
  final note;
  EditNotes({this.title, this.note});
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String _title;
  String _note;
  bool isNew;

  Future<void> save() async {
    if (isNew && _note != null && _note != "") {
      try {
        await Provider.of<NotesProvider>(context, listen: false)
            .createNote(Note(
          date: DateTime.now(),
          note: _note,
          title: _title,
        ));
        Navigator.of(context).pop();
      } catch (error) {
        print(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;
    if (args == null) {
      isNew = false;
    } else {
      isNew = true;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        actions: [
          FlatButton(
            child: textWidget(
                text: 'Save', color: white1, fontweight: FontWeight.bold),
            onPressed: save,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              initialValue: widget.title == "" ? null : widget.title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: medEmphasisTextColor,
              ),
              decoration: InputDecoration(
                  hintText: widget.title == null ? "Title" : null,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70)),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            TextFormField(
              initialValue: widget.title == "" ? null : widget.note,
              maxLines: 15,
              style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  color: white1),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _note = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
