import 'package:flutter/material.dart';
import 'package:flutter_start/api/request.dart';
import 'package:flutter_start/models/home_models.dart';
import 'package:flutter_start/views/home/childCpns/tv_series.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeBady(),
    );
  }
}

class HomeBady extends StatefulWidget {
  @override
  _HomeBadyState createState() => _HomeBadyState();
}

class _HomeBadyState extends State<HomeBady> {
  List<TVSeriesItem> tvSeriesItem = [];
  @override
  void initState() {
    super.initState();
    HttpRequest.request(
            "j/search_subjects?type=tv&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=0")
        .then((res) {
      final subjects = res.data['subjects'];
      List<TVSeriesItem> movies = [];
      for (var sub in subjects) {
        movies.add(TVSeriesItem.fromMap(sub));
      }
      setState(() {
        this.tvSeriesItem = movies;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: tvSeriesItem.length,
        itemBuilder: (BuildContext context, int index) {
          return TVSeriresListItem(tvSeriesItem[index]);
        },
      ),
    );
  }
}
