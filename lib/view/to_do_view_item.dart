import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/home/home_view_model.dart';

class TodoViewitem extends ConsumerWidget {
  TodoViewitem({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final todo = state.firstWhere((todo) => todo.id == id);
    final vm = ref.read(homeViewModelProvider.notifier);

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
              // vm(id: id);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12),
                color: todo.isDone ? Colors.green : null,
              ),
              child: todo.isDone
                  ? Icon(Icons.check, color: Colors.white, size: 19)
                  : null,
            ),
          ),
          SizedBox(width: 20),
          //
          Expanded(
            child: Text(
              todo.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          ),

          todo.isFavorite
              ? Icon(Icons.star, size: 24, color: Colors.black)
              : Icon(Icons.star_border, size: 24, color: Colors.black),
          IconButton(
            onPressed: () {
              vm.deleteTodo(id: id);
            },
            icon: Icon(Icons.delete, size: 24, color: Colors.black),
            //add todo
          ),
        ],
      ),
    );
  }
}
