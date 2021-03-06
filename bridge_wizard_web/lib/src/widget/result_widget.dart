import 'package:bridge_wizard_web/src/data/round_entry_model.dart';
import 'package:bridge_wizard_web/src/pages/main_page.dart';
import 'package:bridge_wizard_web/src/widget/sidebar_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bridge_wizard_web/src/data/diary_entry_model.dart';
import 'package:bridge_wizard_web/src/widget/competitor/diary_card.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    // TODO: Answer 3 to add a stream that returns documents
    final diaryEntries =
        Firestore.instance
        .collection("Tournament")
        .document(tournamentID)
        .collection("Section")
        .document(sectionID)
        .collection("Result")
        .orderBy("rank")
        .snapshots()
        .map((snapshot) {
      return snapshot.documents.map((doc) => DiaryEntry.fromDoc(doc)).toList();
    });
    // TODO: Answer 4 to change provider to stream provider
    return StreamProvider<List<DiaryEntry>>(
      create: (_) => diaryEntries,
      child: MaterialApp(
        title: 'My Diary',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.pink,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => MyHomePage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final diaryEntries = Provider.of<List<DiaryEntry>>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 3 / 5,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10),
              if (diaryEntries != null)
                for (var diaryData in diaryEntries)
                  DiaryCard(diaryEntry: diaryData),
              if (diaryEntries == null)
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 1.5,
        onPressed: () => 
        _createResult(),
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
_createResult()async{
  for (var i = 1; i <= 5; i++) {
    RoundEntry round;
    Firestore.instance
        .collection("Tournament")
        .document(tournamentID)
        .collection("Section")
        .document(sectionID)
        .collection("Score")
        .where('board_NO', isEqualTo: "["+i.toString()+"]")
        .snapshots().forEach((board) {
          for (var table in board.documents.toList()) {
            print(table["score"]);
          }
        });
  }
}
var diaryEntry =
    'People just dont understand how I am built and reason. There is so much that I want to explain. However, I cannot do that as I have the disability of talking cock. Someday they will understand that talking cock is great';
