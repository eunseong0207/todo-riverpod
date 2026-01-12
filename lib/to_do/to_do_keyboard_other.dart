import 'package:flutter/material.dart';
import 'package:tasks/to_do/to_do_entity.dart';

class Keyboard extends StatefulWidget {
  const Keyboard({super.key, required this.onCreate});

  final void Function(ToDoEntity) onCreate;

  @override
  State<Keyboard> createState() => KeyboardState();
}

class KeyboardState extends State<Keyboard> {
  bool showdesc = false;
  bool onTogglFavorite = false;

  TextEditingController textcontroller = TextEditingController();
  TextEditingController descriptioncontorller = TextEditingController();

  void saveTodo() {
    //
    if (textcontroller.text.isEmpty) {
      return;
    }

    widget.onCreate(
      ToDoEntity(
        title: textcontroller.text,
        description: descriptioncontorller.text,
        isFavorite: onTogglFavorite,
        isDone: false,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    textcontroller.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // 빈 공간 터치할 때 키보드 내려가도록 설정
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 12,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: textcontroller,
                autofocus: true,
                style: TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: '새 할일',
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return '할 일을 입력해주세요';
                  }
                  return null;
                },
              ),
              if (showdesc)
                TextFormField(
                  controller: descriptioncontorller,
                  minLines: 1,
                  maxLines: 3,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    hintText: "세부 정보는 여기에 작성해 봅니다.",
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return '세부 내용을 입력해주세요';
                    }
                    return null;
                  },
                ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showdesc = !showdesc;
                      onTogglFavorite = !onTogglFavorite;
                      setState(() {});
                    },
                    icon: onTogglFavorite
                        ? Icon(Icons.star, size: 24, color: Colors.black)
                        : Icon(
                            Icons.star_border,
                            size: 24,
                            color: Colors.black,
                          ),
                  ),

                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      saveTodo();
                      final result = formKey.currentState?.validate();
                    },
                    child: Text("저장"),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
