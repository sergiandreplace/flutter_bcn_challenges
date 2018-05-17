import 'package:challenge_12/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).textTheme.copyWith(
          display1: new TextStyle(
            inherit: true,
            fontSize: 24.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        );
    return MaterialApp(
      title: "Challenge 1",
      theme: ThemeData(brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        canvasColor: Colors.white,
        textTheme: _theme,
        primaryColorBrightness: Brightness.light,
        primaryColor: Colors.amber,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(),

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
          Header(),
          ProjectDetail(),
          //ProjectStatus(),
          CallToActionButton("Back this project"),
        ],
      ),
    );
  }
}


class ProjectDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context).textTheme;
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Sustentability S/A: A mobile game about managing green business",
              style: _theme.display1,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
                "O estilo será em point-click, onde os personagens se movimentam com o click da tela.",
                style: _theme.subhead),
          ),
          InkWell(
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              child: new Text('Read more'.toUpperCase(),
                  style: _theme.body2.copyWith(color: Colors.amber)),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: Image.asset(
            "detail.jpg",
            height: 180.0,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Category(),
              UserAvatar("Pedro J.", "avatar.jpg"),
            ],
          ),
        ),
      ],
    );
  }
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        new Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.videogame_asset,
            size: 16.0,
            color: Colors.grey,
          ),
        ),
        Text(
          "Game",
          style: Theme.of(context).textTheme.caption,
        )
      ],
    );
  }
}

