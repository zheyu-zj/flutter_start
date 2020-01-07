import 'package:flutter/material.dart';
import 'package:flutter_start/components/tabbar_item.dart';
import 'package:flutter_start/views/group/index.dart';
import 'package:flutter_start/views/home/index.dart';
import 'package:flutter_start/views/mall/index.dart';
import 'package:flutter_start/views/profile/index.dart';
import 'package:flutter_start/views/subject/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "豆瓣App",
      home: MySyackPage(),
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}

class MySyackPage extends StatefulWidget {
  @override
  _MySyackPageState createState() => _MySyackPageState();
}

class _MySyackPageState extends State<MySyackPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            Home(),
            Subject(),
            Group(),
            Mall(),
            Profile(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            TabBarItem(Icons.home, "首页"),
            TabBarItem(Icons.subject, "书影音"),
            TabBarItem(Icons.group, "小组"),
            TabBarItem(Icons.local_mall, "市集"),
            TabBarItem(Icons.my_location, "我的"),
          ],
          onTap: (int index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        ),
      ),
    );
  }
}
