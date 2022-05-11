import 'package:flutter/material.dart';
import 'package:sexyyy_ui_poc/models/note_for_listing.dart';

import 'note_modify.dart';

class NoteList extends StatelessWidget {
  NoteList({Key? key}) : super(key: key);


  final notes = [
    NoteForListing(
      noteId: "1",
      noteTitle: "Note 1",
      noteCreatedTime: DateTime.now(),
      noteEditedTime: DateTime.now()
    ),
    NoteForListing(
        noteId: "2",
        noteTitle: "Note 2",
        noteCreatedTime: DateTime.now(),
        noteEditedTime: DateTime.now()
    ),NoteForListing(
        noteId: "3",
        noteTitle: "Note 3",
        noteCreatedTime: DateTime.now(),
        noteEditedTime: DateTime.now()
    ),
    NoteForListing(
        noteId: "4",
        noteTitle: "Note 4",
        noteCreatedTime: DateTime.now(),
        noteEditedTime: DateTime.now()
    ),
  ];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.tealAccent),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Note List'),
      ),
      body: ListView.separated(
          itemBuilder: (_, index){
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                child: Text(
                  notes[index].noteId!
                ),
              ),
              title: Text(
                notes[index].noteTitle!
              ),
              subtitle: Text(
                " You created this note on ${formatDateTime(notes[index].noteCreatedTime!)} and the last time you edited it is ${formatDateTime(notes[index].noteEditedTime!)} "
              ),
              trailing: Icon(Icons.delete, color: Colors.teal)
            );
          },
          separatorBuilder: (_,__) => const Divider(height: 20, thickness: 2, color: Colors.tealAccent,),
          itemCount: notes.length),
    );
  }
}
