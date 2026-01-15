// 1. 관리해야될 상태 클래스

// 2. 뷰모델
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/to_do/to_do_entity.dart';
import 'package:tasks/to_do_repository.dart';

class HomeViewModel extends Notifier<List<ToDoEntity>> {
  @override
  List<ToDoEntity> build() {
    getAllTodos();
    return [];
  }

  final todoRepo = ToDoRepository();

  Future<void> getAllTodos() async {
    final todos = await todoRepo.getTodos();
    state = todos ?? [];
  }

  Future<ToDoEntity?> addTodo({
    required String title,
    required String description,
    required bool isFavorite,
    //
  }) async {
    // id를 받아오기위한 변수
    final docid = FirebaseFirestore.instance.collection('todos').doc().id;
    final ToDoEntity newtodo = ToDoEntity(
      title: title,
      description: description,
      isFavorite: isFavorite,
      isDone: false,
      id: docid,
    );
    await todoRepo.addtodo(todo: newtodo);
    // 새로운 상태를 보여줘야하기 때문에 state에 담는거임!
    state = [...state, newtodo];
  }

  Future<void> togleIcon({
    required String id,
    required bool isFavorite,
    required bool isDone,
  }) async {
    final todo = state.firstWhere((s) => s.id == id);
    final ToDoEntity newtodo = ToDoEntity(
      id: id,
      title: todo.title,
      description: todo.description,
      isFavorite: isFavorite,
      isDone: isDone,
    );
    await todoRepo.updataTodo(todo: newtodo);
    state = state.map((e) => e.id == newtodo.id ? newtodo : e).toList();
  }

  Future<void> deleteTodo({required String id}) async {
    await todoRepo.deleteTodo(id);
    // state = [];
    final List<ToDoEntity> newList = [];
    for (var s in state) {
      if (s.id != id) {
        newList.add(s);
      }
    }
    state = newList;
  }
}

// 3. 뷰모델 관리자
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<ToDoEntity>>(
  () {
    return HomeViewModel();
  },
);
