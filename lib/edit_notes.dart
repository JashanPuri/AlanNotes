import 'package:alan_notes_app/constants.dart';
import 'package:flutter/material.dart';

class EditNotes extends StatefulWidget {
  static const routeName = '/edit-notes';
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.color_lens_rounded,color: white1,size: 30,),
          ),
        ],
      ),
    );
  }
}
