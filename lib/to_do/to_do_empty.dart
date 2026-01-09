// 할 일 없을 때 표시되는 화면
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset("lib/image/todo_image.webp", width: 100, height: 100),
          SizedBox(height: 12),
          Text(
            "아직 할 일이 없음",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "할 일을 추가하고 $name에서 \n할 일을 추적하세요.",
            style: TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.center,
            // 글자 가운데 정렬
          ),
        ],
      ),
    );
  }
}
