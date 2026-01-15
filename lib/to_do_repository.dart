import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasks/to_do/to_do_entity.dart';

class ToDoRepository {
  Future<void> updataTodo({required ToDoEntity todo}) async {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('todos');
    final docRef = collectionRef.doc(todo.id);
    docRef.update(todo.toJson());
  }

  Future<void> deleteTodo(String id) async {
    //삭제할거임
    try {
      final firestore = FirebaseFirestore.instance;
      // 파이어 베이스 가져올거임
      final collectionRef = firestore.collection('todos');
      // todos를 참조할거임
      final docRef = collectionRef.doc(id);
      // 컬렉션 안에 문서들을 id와 합친다는뜻
      await docRef.delete();
    } catch (e) {}
  }

  Future<List<ToDoEntity>?> getTodos() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // 파이어 베이스 가져올거임
    final collectionRef = firestore.collection('todos');
    // 파이어베이스에서 todos 를 참조할거야
    final result = await collectionRef.get(); // collectionRef 가져올거야 = todos
    final docs = result.docs; // 파이어베이스 todos 안에 있는 문서 다 가져올 거야
    final todos = docs.map((todo) {
      // 문서를 fromJson 사용해서 문서랑 id 를 합칠거야
      final map = {'id': todo.id, ...todo.data()};
      return ToDoEntity.fromJson(map);
    }).toList();
    return todos;
  }

  //id,title,description,isFavorite,isDone => firebase 저장해줘
  Future<void> addtodo({required ToDoEntity todo}) async {
    try {
      // firestor instance 만들기
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      // 컬렉션에 참조 할 수 있는 컬렉션 참조 만들어야함
      final collectionRef = firestore.collection('todos');
      // todos 컬렉션에 저장할 수 있는 무언가를 만들어줘야함
      final docRef = collectionRef.doc(todo.id);
      // todo.id와 동일한 값의 변수들을 불러오는 느낌
      // 넣을 데이터인 map 만들기
      final data = todo.toJson();
      // map 저장
      await docRef.set(data);
    } catch (e) {}
  }
}
