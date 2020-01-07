int counter = 1;

class TVSeriesItem {
  int rank;
  String imageURL;
  String title;
  int playDate;
  String rate;
  String originalTitle;

  TVSeriesItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.imageURL = json["cover"];
    this.title = json["title"];
    this.playDate = json["cover_x"];
    this.rate = json["rate"];
    this.originalTitle = json["url"];
  }
}
