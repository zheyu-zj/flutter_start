import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.my_location,
            ),
            title: Text("wode"),
            subtitle: Text("nide"),
          ),
          ListTile(
            leading: Icon(
              Icons.my_location,
            ),
            title: Text("wode"),
            subtitle: Text("nide"),
          ),
          ListTile(
            leading: Icon(
              Icons.my_location,
            ),
            title: Text("wode"),
            subtitle: Text("nide"),
          ),
          ListTile(
            leading: Icon(
              Icons.my_location,
            ),
            title: Text("wode"),
            subtitle: Text("nide"),
          ),
          ListTile(
            leading: Icon(
              Icons.my_location,
            ),
            title: Text("wode"),
            subtitle: Text("nide"),
          ),
        ],
      ),
    );
  }
}
