import 'package:flutter/material.dart';
import 'package:tasks/to_do/to_do_detail_page.dart';
import 'package:tasks/to_do/to_do_entity.dart';
import 'package:tasks/to_do/to_do_view_item.dart';

class TodoView extends StatefulWidget {
  const TodoView({
    super.key,
    required this.toList,
    required this.onToggleDone,
    required this.onTogglFavorite,
  });
  final List<ToDoEntity> toList;
  final void Function(int index, bool value) onToggleDone;
  final void Function(int index, bool value) onTogglFavorite;

  @override
  State<TodoView> createState() => TodoViewState();
}

class TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 200),
        itemCount: widget.toList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TodoDetailPage(realtodo: widget.toList, index: index,onTogglFavorite: widget.onTogglFavorite),
                ),
              );
            },
            child: TodoViewitem(
              index: index,
              content: widget.toList[index].title,
              isDone: widget.toList[index].isDone,
              onDone: (index, value) {
                widget.onToggleDone(index, value);
              },
              isFavorite: widget.toList[index].isFavorite,
              onFavorite: (int index, bool value) {
                widget.onTogglFavorite(index, value);
              },
            ),
          );
        },
      ),
    );
  }
}
