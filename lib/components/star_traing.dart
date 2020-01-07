import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating; //当前评分
  final double maxRating; //最高评分
  final Widget unSelectedImg; //未选中图片
  final Widget selectedImg; //选中图片
  final int count; //显示个数
  final double size; //大小
  final Color unColor; //默认Icon时，未选中颜色
  final Color color; //默认Icon时，选中颜色
  StarRating({
    @required this.rating,
    this.maxRating = 10,
    Widget unSelectedImg,
    Widget selectedImg,
    this.count = 5,
    this.size = 30,
    this.unColor = Colors.grey,
    this.color = Colors.red,
  })  : unSelectedImg = unSelectedImg ??
            Icon(
              Icons.star,
              size: size,
              color: unColor,
            ),
        selectedImg = selectedImg ??
            Icon(
              Icons.star,
              size: size,
              color: color,
            );
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        getUnselectedStar(),
        getSelectedStar(),
      ],
    );
  }

  Widget getUnselectedStar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (int index) {
        return widget.unSelectedImg;
      }),
    );
  }

  Widget getSelectedStar() {
    double oneValue = widget.maxRating / widget.count;
    // 1.完整的个数
    int entireCount = (widget.rating / oneValue).floor();
    // 2.不完整的个数
    double leftValue = (widget.rating - entireCount * oneValue);
    double ratioLeft = leftValue / oneValue;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (int index) {
        if (index < entireCount) return widget.selectedImg;
        return ClipRect(
            clipper: MyRectClipper(width: widget.size * ratioLeft),
            child: widget.selectedImg);
      }),
    );
  }
}

class MyRectClipper extends CustomClipper<Rect> {
  double width;
  MyRectClipper({this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    // TODO: implement shouldReclip
    return width != oldClipper.width;
  }
}
