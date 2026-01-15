import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/home/home_view_model.dart';
import 'package:tasks/view/todo_view.dart';
import 'package:tasks/to_do/to_do_empty.dart';
import 'package:tasks/to_do/to_do_keyboard_other.dart';
import 'package:tasks/to_do/weather_bottom.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  String name = "스파르타`s Tasks";

  @override
  Widget build(BuildContext context) {
    homeViewModelProvider;

    final todos = ref.watch(homeViewModelProvider);
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
              return SingleChildScrollView(child: Keyboard());
            },
          );
        },
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(100),
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      // ----- 빨간배경 + 버튼 종료 -----
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: WeatherBottom(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          todos.isNotEmpty
              ? TodoView(
                )
              : Empty(name: name),
        ],
      ),
    );
  }
}
