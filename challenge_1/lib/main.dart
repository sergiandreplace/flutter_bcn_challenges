import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Challenge 1",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        canvasColor: Colors.white,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        title: Text("CrowdFounder"),
      ),
      body: new Column(
        children: <Widget>[
          ProjectImage(),
          //ProjectDetail(),
          //ProjectStatus(),
          //ProjectAction(),
        ],
      ),
    );
  }
}

class ProjectImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Image.asset(
          "detail.jpg",
          height: 240.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        new Align(
          alignment: Alignment.centerRight,
          child: new Padding(
            padding: const EdgeInsets.only(top: 200.0, right: 16.0),
            child: UserAvatar("mariano","avatar.jpg"),
          ),
        ),
      ],
    );
  }
}

class UserAvatar extends StatelessWidget {

  final String _avatar;

  final String _name;

  UserAvatar(this._name, this._avatar);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
              color: Colors.white,
              width: 8.0,
            ),
          ),
          child: CircleAvatar(
            radius: 36.0,
            backgroundImage: AssetImage(_avatar),
          ),
        ),
      Text(_name)
      ],
    );
  }
}
