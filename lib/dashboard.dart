import 'package:alan_notes_app/edit_notes.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import './models.dart';
import './grid_item.dart';

class DashBoard extends StatelessWidget {
  final dummyData = [
    Note(
        id: '1', title: 'Note 1', note: "This is note 1", date: DateTime.now()),
    Note(
        id: '2', title: 'Note 2', note: "This is note 2", date: DateTime.now()),
    Note(
        id: '3', title: 'Note 3', note: "This is note 3", date: DateTime.now()),
    Note(
        id: '4', title: 'Note 4', note: "This is note 4", date: DateTime.now()),
    Note(id: '5', title: 'Note 5', note: "This is note 5", date: DateTime.now())
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(EditNotes.routeName);
          },
          child: Icon(Icons.add),
          backgroundColor: accentColor,
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
                  color: white1,
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
                      dummyData.length,
                      (index) {
                        return GridItem(
                            date: dummyData[index].date,
                            title: dummyData[index].title,
                            note: dummyData[index].note);
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
