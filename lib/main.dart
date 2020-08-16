import 'package:flutter/material.dart';
import 'package:mytodo/View/todoList.dart';
import 'package:mytodo/View/addTodo.dart';

// アプリの起動
void main() {
  runApp(MyApp());
}

// TOPページ起動
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY TODO',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(),
    );
  }
}
