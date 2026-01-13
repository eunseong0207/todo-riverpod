class ToDoEntity {
  ToDoEntity({
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.isDone,
    required this.id,
  }); // 네임드 파라미터를 사용하는게 좋음

  final String id;
  final String title;
  final String? description;
  bool isFavorite;
  bool isDone;

  // 1. fromJson 네임드 생성자 만들기
  ToDoEntity.fromJson(Map<String, dynamic> map)
    : this(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        isFavorite: map['isFavorite'],
        isDone: map['isDone'],
      );
  // 2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isFavorite': isFavorite,
      'isDone': isDone,
    };
    //
  }
}
