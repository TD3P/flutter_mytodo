import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id = Uuid().v1();
  String title;

  TodoModel({
    @required this.title,
  });
  // TodoModel(this.title);
  // TodoModel(String title) {
  //   @required this.title = title;
  // }
}
