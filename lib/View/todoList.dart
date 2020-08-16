import 'package:flutter/material.dart';
import 'package:mytodo/Model/todoModel.dart';

// TOPページ
class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

// TOPページのステータス管理
class _TodoListState extends State<TodoList> {
  // todoの一覧リスト変数を用意
  List<TodoModel> todoList = [];

  @override
  Widget build(BuildContext context) {
    // scaffoldは画面構成の基本widget
    return Scaffold(
      // アプリ上部のコンテンツ設定
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("TODO一覧"),
      ),
      // アプリのコンテンツ部分の設定
      body: ListView.builder(
        // リストの長さを計算
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding:
                EdgeInsets.only(top: 0.0, right: 0.0, bottom: 0.0, left: 0.0),
            margin:
                EdgeInsets.only(top: 1.0, right: 0.0, bottom: 0.0, left: 0.0),
            color: Colors.cyan[600],
            child: ListTile(
              leading: Icon(Icons.star),
              title: Text(
                // リストに表示する文字列を設定
                ("$index : ${todoList[index].title}"),
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed('/add');
          if (result != null) {
            setState(() {
              todoList.add(result);
            });
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
