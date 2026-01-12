import 'package:flutter/material.dart';

class WeatherBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.only(top: 12, right: 12),
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('업데이트 시간 : 25년 10월 27일 23시 45분'),
              Icon(Icons.dark_mode),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('날씨: 맑음 '), Text('온도: 12.2'), Text('풍속: 4.6m/s')],
          ),
          //
        ],
      ),
    );
  }
}
