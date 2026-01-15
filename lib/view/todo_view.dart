import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/home/home_view_model.dart';
import 'package:tasks/to_do/to_do_detail_page.dart';
import 'package:tasks/to_do/to_do_entity.dart';
import 'package:tasks/view/to_do_view_item.dart';

class TodoView extends ConsumerWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 200),
        itemCount: state.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TodoDetailPage(id: state[index].id),
                ),
              );
            },
            child: TodoViewitem(id: state[index].id),
          );
        },
      ),
    );
  }
}
