import 'package:flutter/material.dart';
import 'package:flutter_start/components/dashed_line.dart';
import 'package:flutter_start/components/star_traing.dart';
import 'package:flutter_start/models/home_models.dart';

class TVSeriresListItem extends StatelessWidget {
  final TVSeriesItem item;
  TVSeriresListItem(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 10,
        color: Color(0xffe2e2e2),
      ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getRankWidget(),
          SizedBox(height: 12),
          getMovieContent(),
          SizedBox(height: 12),
          getOriginWidget(),
        ],
      ),
    );
  }

  // 1.获取排名显示的widget
  Widget getRankWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(3)),
      child: Text(
        "No.${item.rank}",
        style: TextStyle(
          color: Color.fromARGB(255, 131, 95, 36),
          fontSize: 18,
        ),
      ),
    );
  }

// 2.获取中间内容显示widget
  Widget getMovieContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getMovieImage(),
        getDetailDescWidget(),
        getDashedWidget(),
        getWishWidget(),
      ],
    );
  }

// 2.1获取显示的图片
  Widget getMovieImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(
        item.imageURL,
        height: 150,
      ),
    );
  }

  // 2.2获取详情藐视的widget
  Widget getDetailDescWidget() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            getMovieNameWidget(),
            getRatingWidget(),
            getIntroduceWidget(),
          ],
        ),
      ),
    );
  }

  // 2.2.1获取电影名称
  Widget getMovieNameWidget() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.red,
          size: 24,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: "       " + item.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: "（2019）",
            style: TextStyle(fontSize: 18),
          )
        ]))
      ],
    );
  }

  // 2.2.2获取电影评分
  Widget getRatingWidget() {
    return Row(
      children: <Widget>[
        StarRating(
          rating: double.parse(item.rate),
          color: Colors.orange,
          size: 20,
        ),
        Text(item.rate)
      ],
    );
  }

  // 2.2.3获取电影简介
  Widget getIntroduceWidget() {
    return Text(
      '${item.title} / ${item.imageURL} / ${item.rank} / ${item.rate}',
      style: TextStyle(fontSize: 16),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // 2.3获取分割线的widget
  Widget getDashedWidget() {
    return Container(
      height: 100,
      width: 1,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: 2,
        dashedHeight: 5,
        count: 12,
        color: Color(0xffaaaaaa),
      ),
    );
  }

  // 2.4想看的Widget
  Widget getWishWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        children: <Widget>[
          Icon(
            Icons.transfer_within_a_station,
            size: 30,
            color: Color.fromARGB(255, 235, 170, 60),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "想看",
            style: TextStyle(
              color: Color.fromARGB(255, 235, 170, 60),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

// 3.获取原始电影名称的widget
  Widget getOriginWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        item.title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 18,
        ),
      ),
    );
  }
}
