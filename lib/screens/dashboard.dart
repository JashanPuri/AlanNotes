import 'package:alan_notes_app/providers/notes_provider.dart';

import './edit_notes.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/models.dart';
import '../widgets/grid_item.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  static const routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<NotesProvider>(context).notes;
    return Scaffold(
        backgroundColor: themeColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(EditNotes.routeName);
          },
          child: Icon(
            Icons.add,
            color: themeColor,
          ),
          backgroundColor: secondaryThemeColor,
        ),
        appBar: AppBar(
          title: textWidget(
              text: "My Notes", fontsize: 22.0, fontweight: FontWeight.bold),
          backgroundColor: themeColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textWidget(
                  text: "Hello There !",
                  fontsize: 40.0,
                  color: secondaryThemeColor,
                  fontweight: FontWeight.bold),
              SizedBox(
                height: 20,
              ),
              Flexible(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: List.generate(
                      data.length,
                      (index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(EditNotes.routeName,
                                arguments: {
                                  'title': data[index].title,
                                  'notes': data[index].note,
                                  });
                          },
                          child: GridItem(
                              date: data[index].date,
                              title: data[index].title,
                              note: data[index].note),
                        );
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
