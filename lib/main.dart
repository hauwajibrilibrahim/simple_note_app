import 'package:flutter/material.dart';
import 'package:note_app/pages/create_edit_note_page.dart';
import 'package:note_app/pages/note_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';
import 'package:note_app/provider/note_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NoteProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink, fontFamily: 'Roboto'),
        routes: {
          '/': (context) => const NoteListPage(),
          '/create-edit-note': (context) => const CreateEditNotePage(),
        },
      ),
    );
  }
}
