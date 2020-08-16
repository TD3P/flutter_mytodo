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
      // 背景色
      backgroundColor: Colors.teal[100],

      // アプリ上部のコンテンツ設定
      appBar: AppBar(
        title: Text("TODO一覧"),
      ),

      // アプリのコンテンツ部分の設定
      body: ListView.builder(
        // リストの長さを計算
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return _listCard(index);
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

  Widget _listCard(index) {
    return Card(
      margin: EdgeInsets.only(top: 6.0, right: 8.0, bottom: 0.0, left: 8.0),
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
  }
}
