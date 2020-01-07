import 'package:flutter/material.dart';
import 'package:flutter_start/components/star_traing.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小组"),
      ),
      body: Center(
        child: StarRating(
          rating: 8.7,
          color: Colors.pink,
          size: 20,
          count: 10,
        ),
      ),
    );
  }
}
