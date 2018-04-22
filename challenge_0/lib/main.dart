import 'package:challenge_0/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: appTheme,
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _appBar(),
      body: new HomeBody(),
    );
  }

  AppBar _appBar() => new AppBar(
        title: new Text("Profile"),
        elevation: 0.0,
        leading: new IconButton(onPressed: () {}, icon: new Icon(Icons.menu)),
        actions: <Widget>[
          new IconButton(onPressed: () {}, icon: new Icon(Icons.search)),
        ],
      );
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        _options(),
        _avatar(),
        _profileName(),
        _profileBio(),
        _profileData(),
        _followButton()
      ],
    );
  }

  Row _options() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new IconButton(icon: new Icon(Icons.mail), onPressed: () {}),
        new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {})
      ],
    );
  }

  Widget _avatar() {
    return new Center(
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 16.0),
        child: new CircleAvatar(
          radius: 60.0,
          backgroundImage: new AssetImage(
            "profile.jpg",
          ),
        ),
      ),
    );
  }

  Text _profileName() {
    return new Text(
      "Eric Schmidt",
      style: AppTextStyles.profileName,
      textAlign: TextAlign.center,
    );
  }

  Padding _profileBio() {
    return new Padding(
      padding: const EdgeInsets.fromLTRB(54.0, 8.0, 54.0, 32.0),
      child: new Text(
        "Snowboarder, superhero and writer. Sometimes I work at Google as Executive Chairman",
        textAlign: TextAlign.center,
        style: AppTextStyles.profileBio,
      ),
    );
  }

  Container _profileData() {
    var borderSide = new BorderSide(color: AppColors.borderColor, width: 2.0);
    return new Container(
      decoration: new BoxDecoration(
        border: new Border(
          top: borderSide,
          bottom: borderSide,
        ),
      ),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: new Row(
          children: <Widget>[
            _profileDataItem("Posts", 343),
            _profileDataItem("Followers", 673826),
            _profileDataItem("Folowing", 275),
          ],
        ),
      ),
    );
  }

  Widget _profileDataItem(String name, int amount) => new Expanded(
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: new Column(
            children: <Widget>[
              new Text(
                new DefaultMaterialLocalizations().formatDecimal(amount),
                style: AppTextStyles.socialInfoAmount,
              ),
              new Text(
                name.toUpperCase(),
                style: AppTextStyles.socialInfoName,
              ),
            ],
          ),
        ),
      );

  Padding _followButton() {
    return new Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 42.0),
      child: new SizedBox(
        height: 48.0,
        width: double.infinity,
        child: new FlatButton.icon(
            icon: new Icon(Icons.person_outline),
            color: AppColors.buttonColor,
            onPressed: () {},
            label: new Text(
              "Follow",
              style: AppTextStyles.button,
            )),
      ),
    );
  }
}
