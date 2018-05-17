import 'package:flutter/material.dart';


class CallToActionButton extends StatelessWidget {
  final String text;

  const CallToActionButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      child: new RaisedButton(
        elevation: 2.0,
        highlightElevation: 1.0,
        onPressed: () {},
        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Text(text.toUpperCase()),
        ),
      ),
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
            radius: 32.0,
            backgroundColor: Colors.red,
            backgroundImage: AssetImage(_avatar),
          ),
        ),
        Text(_name, style: Theme.of(context).textTheme.body2),
      ],
    );
  }
}
