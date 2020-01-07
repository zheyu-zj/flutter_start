import 'package:flutter/material.dart';
import 'package:flutter_start/components/dashed_line.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          // color: Colors.pink,
          child: DashedLine(
            axis: Axis.horizontal,
            dashedWidth: 8,
            dashedHeight: 2,
            count: 12,
          ),
        ),
      ),
    );
  }
}
