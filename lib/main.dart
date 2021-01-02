import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WRYYYYY')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
      future: _initialization,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _streamBuilder();
        }
        return LinearProgressIndicator();
      },
    );
  }

  Widget _streamBuilder() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('rushes').snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        }
        return _buildList(snapshot.data.docs);
      },
    );
  }

  Widget _buildList(List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) {
        return _buildListItem(data);
      }).toList(),
    );
  }

  Widget _buildListItem(DocumentSnapshot data) {
    final rushes = Rushes(data);

    return Padding(
      // key: ValueKey(rushes.name),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: ListTile(
            title: Text(rushes.makeOraOra()),
            trailing: Text(rushes.times.toString()),
            onTap: () {
              rushes.reference.update({'times': FieldValue.increment(1)});
            }),
      ),
    );
  }
}

class Rushes {
  String word;
  int times;
  DocumentReference reference;

  Rushes(DocumentSnapshot snapshot) {
    var map = snapshot.data();
    this.word = map['word'];
    this.times = map['times'];
    this.reference = snapshot.reference;
  }

  String makeOraOra() {
    var ret = "";
    for (var i = 0; i < times; i++) {
      ret += word;
    }
    return ret;
  }
}
