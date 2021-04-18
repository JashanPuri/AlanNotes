import 'package:alan_notes_app/auth/login_screen.dart';
import 'package:alan_notes_app/providers/auth_provider.dart';
import 'package:alan_notes_app/providers/notes_provider.dart';

import './edit_notes.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/grid_item.dart';
import 'package:provider/provider.dart';
import 'package:animations/animations.dart';

class DashBoard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<NotesProvider>(context, listen: false).fetchAndSetNotes();
  }

  @override
  Widget build(BuildContext context) {
    //final data = Provider.of<NotesProvider>(context, listen: false).notes;
    //print("data is: $data");
    return Scaffold(
<<<<<<< HEAD
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(EditNotes.routeName, arguments: {'isNew': true});
          },
          child: Icon(
            Icons.add,
            color: themeColor,
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
=======
        backgroundColor: themeColor,
        floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
                color: themeColor,
              ),
              backgroundColor: secondaryThemeColor,
            ),
>>>>>>> bb8c373f032d77fd7ca0609b729f23485b073f23
        appBar: AppBar(
          title: textWidget(
              text: "My Notes", fontsize: 22.0, fontweight: FontWeight.bold),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Provider.of<Auth>(context, listen: false).logout();
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                })
          ],
        ),
<<<<<<< HEAD
        body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  displacement: 30,
                  child: Consumer<NotesProvider>(
                    builder: (ctx, data, _) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: data.notes == []
                          ? Center(
                              child: textWidget(
                                  text:
                                      "No notes available.\nTry Creating Some.",
                                  color: white1,
                                  fontsize: 20,
                                  fontweight: FontWeight.w300))
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Flexible(
                                  child: GridView.count(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 20,
                                      crossAxisSpacing: 20,
                                      children: List.generate(
                                        data.notes.length,
                                        (index) {
                                          return InkWell(
                                              onTap: () {
                                                Navigator.of(context).pushNamed(
                                                    EditNotes.routeName,
                                                    arguments: {
                                                      'title': data
                                                          .notes[index].title,
                                                      'notes': data
                                                          .notes[index].note,
                                                    });
                                              },
                                              child: OpenContainer(
                                                closedBuilder: (_, action) {
                                                  return GridItem(
                                                      date: data
                                                          .notes[index].date,
                                                      title: data
                                                          .notes[index].title,
                                                      note: data
                                                          .notes[index].note);
                                                },
                                                closedColor: Colors.transparent,
                                                openColor: accentColor,
                                                transitionType:
                                                    ContainerTransitionType
                                                        .fade,
                                                transitionDuration:
                                                    Duration(milliseconds: 300),
                                                openBuilder: (context, action) {
                                                  return EditNotes(
                                                    title:
                                                        data.notes[index].title,
                                                    note:
                                                        data.notes[index].note,
                                                  );
                                                },
                                              ));
                                        },
                                      )),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
=======
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
                        return OpenContainer(
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          closedBuilder: (_, action) {
                            return GridItem(
                                date: data[index].date,
                                title: data[index].title,
                                note: data[index].note);
                          },
                          closedColor: accentColor,
                          transitionDuration: Duration(milliseconds: 600),
                          openBuilder: (context, action) {
                            return EditNotes();
                          },
                        );
                      },
                    )),
              ),
            ],
          ),
>>>>>>> bb8c373f032d77fd7ca0609b729f23485b073f23
        ));
  }
}
