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
          final todoItem = todoList[index];
          return Dismissible(
            key: Key(todoItem.id),
            child: _listCard(index),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("削除しました")));
            },
            background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment(0.9, 0)),
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

  Widget _listCard(index) {
    void _setDoneFlag() {
      setState(() {
        // 何かしらの入力があるときだけ実行
        if (todoList[index].done) {
          todoList[index].done = false;
        } else {
          todoList[index].done = true;
        }
      });
    }

    return Card(
      color: Colors.cyan[600],
      child: ListTile(
        leading: ButtonTheme(
          minWidth: 40,
          height: 50,
          child: FlatButton(
            onPressed: _setDoneFlag,
            child: todoList[index].done
                ? Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.done_outline,
                    color: Colors.grey[400],
                  ),
          ),
        ),
        title: Text(
          // リストに表示する文字列を設定
          // ("$index : ${todoList[index].title}"),
          ("$index : ${todoList[index].done}"),
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
