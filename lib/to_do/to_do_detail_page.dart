// 상세 페이지
import 'package:flutter/material.dart';
import 'package:tasks/to_do/to_do_entity.dart';

class TodoDetailPage extends StatefulWidget {
  const TodoDetailPage({
    super.key,
    required this.realtodo,
    required this.index,
    required this.onTogglFavorite,
  });

  final List<ToDoEntity> realtodo;
  final int index;
  final void Function(int index, bool value) onTogglFavorite;

  @override
  State<TodoDetailPage> createState() => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("새 할 일"),
        backgroundColor: Colors.grey[200],
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onTogglFavorite(
                  widget.index,
                  !widget.realtodo[widget.index].isFavorite,
                );
              });
            },
            icon: widget.realtodo[widget.index].isFavorite
                ? Icon(Icons.star, color: Colors.black)
                : Icon(Icons.star_border, color: Colors.black),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
        ),
        //
      ),

      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.realtodo[widget.index].title),
            Icon(Icons.short_text_rounded),
            if (widget.realtodo[widget.index].description != null)
              Text(widget.realtodo[widget.index].description!),
          ],
        ),
      ),
    );
  }
}
