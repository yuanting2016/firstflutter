/// image相关属性
///加载本地资源图片，如 Image.asset(‘images/logo.png’)；
///加载本地（File 文件）图片，如 Image.file(new File(’/storage/xxx/xxx/test.jpg’))；
///加载网络图片，如 Image.network('http://xxx/xxx/test.gif')

import 'dart:io';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var imageUrl = "/storage/xxx/xxx/test.jpg";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Column(
          children: [
            Image.asset(
              "assets/images/avatar.png",
              width: 50.0,
            ),
            Image.file(new File(imageUrl), fit: BoxFit.cover),
            Image.network("http://xxx/xxx/test.gif")
          ],
        ),
      ),
    );
  }

  ///Image底层使用了ImageCache ImageCache 使用 LRU（Least Recently Used，最近最少使用）算法进行缓存更新策略，并且默认最多存储 1000 张图片，最大缓存限制为 100MB，
 ///当限定的空间已存满数据时，把最久没有被访问到的图片清除。图片缓存只会在运行期间生效，也就是只缓存在内存中。如果想要支持缓存到文件系统，可以使用第三方的CachedNetworkImage控件
/// 支持网络加载失败的默认图
///https://pub.dev/packages/cached_network_image
/// 家长管理APP ImageLoader
///
///  当需要使用小图片时，则可以使用icon 组件，更轻盈
}
