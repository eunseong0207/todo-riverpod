import 'package:flutter/material.dart';
import 'package:tasks/to_do/todo_view.dart';
import 'package:tasks/to_do/to_do_empty.dart';
import 'package:tasks/to_do/to_do_entity.dart';
import 'package:tasks/to_do/to_do_keyboard_other.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoEntity> todoList = [];

  void onCreate(ToDoEntity newtodo) {
    setState(() {
      todoList.add(newtodo);
    });
  }

  String name = "은성`s Tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // ----- 빨간배경 + 버튼 시작 -----
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return SingleChildScrollView(child: Keyboard(onCreate: onCreate));
            },
          );
        },
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
      // ----- 빨간배경 + 버튼 종료 -----
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          todoList.isNotEmpty
              ? TodoView(
                  toList: todoList,
                  onToggleDone: (int index, bool value) {
                    setState(() {
                      todoList[index].isDone = value;
                    });
                  },
                  onTogglFavorite: (int index, bool value) {
                    setState(() {
                      todoList[index].isFavorite = value;
                    });
                  },
                )
              : Empty(name: name),
        ],
      ),
    );
  }
}
