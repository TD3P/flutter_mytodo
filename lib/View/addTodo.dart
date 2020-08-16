import 'package:flutter/material.dart';
import 'package:mytodo/Model/todoModel.dart';

class AddTodo extends StatefulWidget {
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  // todoの一覧リスト変数を用意
  TodoModel todoItem;

  // テキストフィールドのコントローラー設定
  // コントローラーの宣言
  TextEditingController _todoInputController;

  // コントローラーの初期化
  void initState() {
    super.initState();
    _todoInputController = TextEditingController();
  }

  // statefulオブジェクトが削除されるときに、参照を削除してくれる
  void dispose() {
    super.dispose();
    _todoInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scaffoldは画面構成の基本widget
    return Scaffold(
      // アプリ上部のコンテンツ設定
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: Text("TODO追加"),
      ),
      // アプリのコンテンツ部分の設定
      body: Column(
        // column widgetにwidgetのセットを配列で渡す
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _todoInputController,
              decoration: InputDecoration(hintText: '入力してください'),
              autofocus: true,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: 0.0, right: 0.0, bottom: 30.0, left: 0.0),
            child: RaisedButton(
              color: Colors.teal[400],
              textColor: Colors.white,
              child: Text('保存'),
              onPressed: () {
                // 変数の変化をリアルタイムに通知する
                // 何かしらの入力があるときだけ実行
                if (_todoInputController.text.length > 0) {
                  // 配列に入力値を追加
                  todoItem = TodoModel(
                    title: _todoInputController.text,
                  );
                  // テキストボックスを初期化
                  _todoInputController.clear();
                  Navigator.of(context).pop(todoItem);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
