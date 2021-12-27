import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///异步UI更新
///FutureBuilder
///StreamBuilder
Widget build(BuildContext context) {
  return Center(
    child: FutureBuilder<String>(
      future: mockNetworkData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        // 请求已结束
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            // 请求失败，显示错误
            return Text("Error: ${snapshot.error}");
          } else {
            // 请求成功，显示数据
            return Text("Contents: ${snapshot.data}");
          }
        } else {
          // 请求未结束，显示loading
          return CircularProgressIndicator();
        }
      },
    ),
  );
}

mockNetworkData() {
}
// Widget build1(BuildContext context) {
//   return StreamBuilder<int>(
//     stream: counter(), //
//     //initialData: ,// a Stream<int> or null
//     builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//       if (snapshot.hasError)
//         return Text('Error: ${snapshot.error}');
//       switch (snapshot.connectionState) {
//         case ConnectionState.none:
//           return Text('没有Stream');
//         case ConnectionState.waiting:
//           return Text('等待数据...');
//         case ConnectionState.active:
//           return Text('active: ${snapshot.data}');
//         case ConnectionState.done:
//           return Text('Stream 已关闭');
//       }
//       return null; // unreachable
//     },
//   );
// }
//
// counter() {
// }