import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoModel {
  String id = Uuid().v1();
  String title;
  bool done = false;

  TodoModel({
    @required this.title,
  });
}
