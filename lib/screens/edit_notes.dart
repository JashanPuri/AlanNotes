import 'package:alan_notes_app/constants.dart';
import 'package:flutter/material.dart';

class EditNotes extends StatefulWidget {
  static const routeName = '/edit-notes';
  @override
  _EditNotesState createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String title = "";
  String notes = "";
  @override
  Widget build(BuildContext context) {
    Map<String, String> initialValue =
        ModalRoute.of(context).settings.arguments;
    if (initialValue != null) {
      title = initialValue['title'];
      notes = initialValue['notes'];
    }
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.color_lens_rounded,
              color: white1,
              size: 30,
            ),
            onPressed: null,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              initialValue:title == "" ? null : title,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: medEmphasisTextColor),
              decoration: InputDecoration(
                  hintText: title == "" ? "Title" : null,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: medEmphasisTextColor)),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            TextFormField(
              initialValue: title == "" ? null : notes,
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
                  notes = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
