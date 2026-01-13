// 1. 관리해야될 상태 클래스

// 2. 뷰모델
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/to_do/to_do_entity.dart';
import 'package:tasks/to_do_repository.dart';

class HomeViewModel extends Notifier<List<ToDoEntity>> {
  @override
  List<ToDoEntity> build() {
    return [];
  }

  final todoRepo = ToDoRepository();

  Future<void> getAllTodos() async {
    final todos = await todoRepo.getTodos();
    state = todos ?? [];
  }

  Future<void> addTodo({required ToDoEntity todo}) async {
    final todos = await todoRepo.addtodo(todo: todo); 
  //  저장하는거 : 할 일을 추가하는거
  }

  Future<void> togleFavorite({
    required String id,
    required bool isFavorite,
  }) async {
    //
  }
  Future<void> togleDone({required String id, required bool isDone}) async {
    //
  }
  Future<void> deleteTodo({required String id}) async {
    //
  }
}

// 3. 뷰모델 관리자
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<ToDoEntity>>(
  () {
    return HomeViewModel();
  },
);
