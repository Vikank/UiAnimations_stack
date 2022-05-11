import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  const NoteModify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    alignLabelWithHint: true,
                    label: Text('Title'),
                  labelStyle: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold
                  ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal, width: 2, style: BorderStyle.solid))
                ),
                cursorColor: Colors.teal,
                cursorHeight: 25,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                minLines: 1,
                maxLines: 100,
                decoration: const InputDecoration(
                    label: Text('Content'),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold
                    ),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal, width: 2, style: BorderStyle.solid))
                ),
                cursorColor: Colors.teal,
                cursorHeight: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
