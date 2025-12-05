
import 'package:flutter/material.dart';
import 'package:note_app/utils/constant.dart';
import 'package:note_app/widgets/color_selector.dart';

class CreateEditNotePage extends StatefulWidget {
  const CreateEditNotePage({super.key});

  @override
  State<CreateEditNotePage> createState() => _CreateEditNotePageState();
}

class _CreateEditNotePageState extends State<CreateEditNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String _selectedColor = '';
  @override
  void initState() {
    super.initState();
    _selectedColor = AppConstants.getHexFromColor(AppConstants.noteColors[0]);
  }
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.getColorFromHex(_selectedColor),
      
      appBar: AppBar(
        backgroundColor: Colors.white70,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check, color: Colors.black87,)),
        ],
      ),
      body: Column(
        children: [
          ColorSelector(
            selectedColor: _selectedColor,
            onColorSelected: (color){
              setState(() {
                _selectedColor = color;
              });
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextField(
                    controller: _contentController,
                    decoration: const InputDecoration(
                      hintText: 'Start writing your note...',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      
    );
  }
}