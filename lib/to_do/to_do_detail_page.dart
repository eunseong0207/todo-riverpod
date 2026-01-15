// 상세 페이지
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/home/home_view_model.dart';

class TodoDetailPage extends ConsumerWidget {
  const TodoDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final todo = state.firstWhere((todo) => todo.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title, overflow: TextOverflow.ellipsis),
        backgroundColor: Colors.grey[200],

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
            Text(todo.title),
            Icon(Icons.short_text_rounded),
            if (todo.description != null) Text(todo.description!),
          ],
        ),
      ),
    );
  }
}
