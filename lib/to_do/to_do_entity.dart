// 데이터 값
import 'package:flutter/material.dart';

class ToDoEntity extends StatelessWidget {
  ToDoEntity({super.key, 
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
  }); // 네임드 파라미터를 사용하는게 좋음

  final String title;
  final String? description;
  bool isFavorite;
  bool isDone;

  @override
  Widget build(Object context) {
    return Text("data");
  }

  static void add(ToDoEntity newTodoEntiy) {}
}
