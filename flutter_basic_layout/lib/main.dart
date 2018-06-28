import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.green,
      ),
      home: new MyHomePage(),
    );
  }
}

class LakePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  "Oeschinen Lake Campground",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                "Kandersteg, Switzerland",
                style: new TextStyle(color: Colors.grey[500]),
              ),
            ],
          )),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text("41"),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: color,
          ),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, "CALL"),
          buildButtonColumn(Icons.near_me, "ROUTE"),
          buildButtonColumn(Icons.share, "SHARE"),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Top Lakes"),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset(
            "images/lake.jpg",
            width: 600.0,
            height: 240.0,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    void _pushLakePage() {
      Navigator.of(context).push(
        new MaterialPageRoute(builder: (context) {
          return new LakePage();
        }),
      );
    }

    void _pushRowPage() {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return new RowPage();
        },
      ));
    }

    void _pushSizingPage() {
      Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          return SizingPage();
        },
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text("Flutter Basic Layout"),
      ),
      body: new Align(
        alignment: Alignment.center,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: new RaisedButton(
                onPressed: () {
                  _pushLakePage();
                },
                child: new Text("Lake Page"),
              ),
            ),
            new Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: new RaisedButton(
                onPressed: () {
                  _pushRowPage();
                },
                child: new Text("Row Page"),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                _pushSizingPage();
              },
              child: new Text("Sizing Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Row Layout"),
      ),
      body: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Image.asset("images/pic1.jpg"),
            new Image.asset("images/pic2.jpg"),
            new Image.asset("images/pic3.jpg"),
          ],
        ),
      ),
    );
  }
}

class SizingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sizing Widget"),
      ),
      body: new Column(
        children: <Widget>[
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new Image.asset("images/row_expanded_pic1.jpg"),
                flex: 1,
              ),
              new Expanded(
                child: new Image.asset("images/row_expanded_pic2.jpg"),
                flex: 2,
              ),
              //new Image.asset("images/row_expanded_pic1.jpg"),
              //new Image.asset("images/row_expanded_pic2.jpg"),
              new Expanded(
                child: new Image.asset("images/row_expanded_pic3.jpg"),
                flex: 1,
              ),
              //new Image.asset("images/row_expanded_pic3.jpg"),
            ],
          ),
          new Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Icon(Icons.star, color: Colors.green[500],),
                new Icon(Icons.star, color: Colors.green[500],),
                new Icon(Icons.star, color: Colors.green[500],),
                new Icon(Icons.star, color: Colors.black,),
                new Icon(Icons.star, color: Colors.black,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
