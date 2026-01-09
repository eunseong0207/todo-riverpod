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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textcontroller,
              autofocus: true,
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                hintText: '새 할일',
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {},
            ),
            if (showdesc)
              TextField(
                controller: descriptioncontorller,
                minLines: 1,
                maxLines: 3,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(
                  hintText: "세부정보 추가",
                  border: InputBorder.none,
                ),
              ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showdesc = !showdesc;
                    setState(() {});
                  },
                  child: Icon(Icons.short_text_rounded, size: 24),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      onTogglFavorite = !onTogglFavorite;
                    });
                  },
                  icon: onTogglFavorite
                      ? Icon(Icons.star, size: 24, color: Colors.black)
                      : Icon(Icons.star_border, size: 24, color: Colors.black),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    saveTodo();
                  },

                  child: Text("저장"),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
