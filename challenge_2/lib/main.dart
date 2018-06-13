import 'package:challenge_2/domain.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: venice.categories.length,
      child: new Scaffold(
        appBar: AppBar(
          title: Text(venice.name),
          bottom: TabBar(
            tabs: venice.categories
                .map((category) => Tab(text: category.name))
                .toList(),
          ),
        ),
        body: new TabBarView(
          children: venice.categories
              .map((category) => TabPage(category: category))
              .toList(),
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final Category category;

  TabPage({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => SceneryRow(category.scenery[index],
          index.isOdd ? TitleAlignment.left : TitleAlignment.right),
      itemCount: category.scenery.length,
    );
  }
}

enum TitleAlignment { left, right }

class SceneryRow extends StatelessWidget {
  final Scenery scenery;

  final TitleAlignment titleAlignment;

  SceneryRow(this.scenery, this.titleAlignment);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      height: 200.0,
      child: InkWell(
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new SceneryDetailPage(scenery),
              ),
            ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Card(
                elevation: 4.0,
                child: new SceneryImage(scenery: scenery),
              ),
            ),
            FractionallySizedBox(
              alignment: titleAlignment == TitleAlignment.left
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              widthFactor: 0.75,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: new TitleBox(
                    titleAlignment: titleAlignment, scenery: scenery),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SceneryDetailPage extends StatelessWidget {
  final Scenery scenery;

  SceneryDetailPage(this.scenery);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SceneryDetailBody(scenery),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            ),
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Navigator.pop(context)),
          )
        ],
      ),
    );
  }
}

class SceneryDetailBody extends StatelessWidget {
  final Scenery scenery;

  SceneryDetailBody(this.scenery);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0.0),
      //check: https://github.com/flutter/flutter/issues/14842
      children: <Widget>[
        Container(
          height: 240.0,
          child: SceneryImage(scenery: scenery),
        ),
        new TitleCard(scenery: scenery),
        new DescriptionCard(scenery: scenery),
      ],
    );
  }
}

class TitleCard extends StatelessWidget {
  TitleCard({
    Key key,
    @required this.scenery,
  }) : super(key: key);

  final Scenery scenery;

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      height: 200.0,
      child: Card(
        elevation: 5.0,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("${scenery.area}", style: style.title),
                    Text("Area"),
                    Text("${scenery.population}", style: style.title),
                    Text("Population")
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TitleBox(
                  titleAlignment: TitleAlignment.right, scenery: scenery),
            )
          ],
        ),
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  final Scenery scenery;

  const DescriptionCard({Key key, this.scenery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme style = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 4.0,
                    height: 16.0,
                    color: scenery.color,
                    margin: EdgeInsets.only(right: 8.0),

                  ),
                  Text(
                    scenery.title,
                    style: style.title,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 4.0,
                    height: 16.0,
                    margin: EdgeInsets.only(right: 8.0),
                  ),
                  Text(scenery.city, style: style.subhead)
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(scenery.description),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SceneryImage extends StatelessWidget {
  const SceneryImage({
    Key key,
    @required this.scenery,
  }) : super(key: key);

  final Scenery scenery;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "image-${scenery.id}",
      child: Image.asset(
        this.scenery.image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TitleBox extends StatelessWidget {
  const TitleBox({
    Key key,
    @required this.titleAlignment,
    @required this.scenery,
  }) : super(key: key);

  final TitleAlignment titleAlignment;
  final Scenery scenery;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "titleBox-${scenery.id}",
      child: Container(
        padding: EdgeInsets.only(
            left: titleAlignment == TitleAlignment.left ? 36.0 : 36.0),
        color: scenery.color.withOpacity(0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              scenery.title.replaceAll(" ", "\n"),
              style: Theme
                  .of(context)
                  .textTheme
                  .title
                  .apply(color: Colors.white, fontSizeFactor: 1.2),
            ),
            Text(
              scenery.city,
              style: Theme
                  .of(context)
                  .textTheme
                  .caption
                  .apply(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
