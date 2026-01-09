import 'package:flutter/material.dart';

class TodoViewitem extends StatefulWidget {
  TodoViewitem({
    super.key,
    required this.content,
    required this.isDone,
    required this.onDone,
    required this.index,
    required this.isFavorite,
    required this.onFavorite,
  });

  final int index;
  String content;
  bool isDone;
  bool isFavorite;

  final void Function(int index, bool value) onDone;
  final void Function(int index, bool value) onFavorite;

  @override
  State<TodoViewitem> createState() => _TodoViewitemState();
}

class _TodoViewitemState extends State<TodoViewitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              widget.onDone(widget.index, !widget.isDone);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12),
                color: widget.isDone ? Colors.black : null,
              ),
              child: widget.isDone
                  ? Icon(Icons.check, color: Colors.white, size: 19)
                  : null,
            ),
          ),
          SizedBox(width: 20),
          //
          Expanded(
            child: Text(
              widget.content,
              style: TextStyle(
                decoration: widget.isDone ? TextDecoration.lineThrough : null,
                //
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onFavorite(widget.index, !widget.isFavorite);
            },
            icon: widget.isFavorite
                ? Icon(Icons.star, size: 24, color: Colors.black)
                : Icon(Icons.star_border, size: 24, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
