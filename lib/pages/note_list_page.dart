import 'package:flutter/material.dart';
import 'package:note_app/data/dummy_data.dart';
import 'package:note_app/pages/create_edit_note_page.dart';
import 'package:note_app/widgets/note_card.dart';

class NoteListPage extends StatefulWidget {
  const NoteListPage({super.key});

  @override
  State<NoteListPage> createState() => _NoteListPageState();
}

class _NoteListPageState extends State<NoteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
         itemCount: dummyNotes.length,
         itemBuilder: (context, index){
           final note = dummyNotes[index];
           return NoteCard(note: note, onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateEditNotePage(),
              ),
            );
           });
         }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateEditNotePage(),
            ),
          );
        },
        backgroundColor: const Color(0xFFE91E63),
        child: const Icon(Icons.add, size: 32, color: Colors.white,),
      ),
    );
  }
}
