import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(202, 219, 247, 1.0),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'Try something new'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<CheckboxListTile> myInterests = [];
  String activity = "Click the hot tub to generate a random activity";
  String picture = 'assets/press_button.gif';
  void chooseRandomActivity() {
    final _random = new Random();
    setState(() {
      Activity selectedActivity = _activities[_random.nextInt(_activities.length)];
      activity = selectedActivity.title;
      picture = selectedActivity.picture;
    });

  }
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(padding: EdgeInsets.only(bottom: 100.0),
          child: new Card(
            child: Column(
              mainAxisSize: MainAxisSize.min ,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
                      child: new Image.asset(picture),
                  ),
                  ),



//            new Text(
//              'Try this out:',
//              style: new TextStyle(
//                  fontWeight: FontWeight.bold,
//                  fontSize: 30.0,
//                  fontFamily: 'Roboto',
//                  color: Colors.purple,
//              ),
//            ),
                new Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
                    child: new Text(
                      activity,
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blue,
                      ),
                    )
                )
              ],
            ),
          ),
        ),



      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: chooseRandomActivity,
        tooltip: 'Display random activity',
        child: new Icon(Icons.hot_tub),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Activity {
  String title;
  int frequency;
  String picture;
  Activity(String title, int frequency, String picture) {
    this.title = title;
    this.frequency = frequency;
    this.picture = picture;
  }
}

List<Activity> _activities = <Activity>[
  Activity('Sun bathing', 0, 'assets/sunbathing.jpg'),
  Activity('Call an old friend', 0, 'assets/call_friend.jpg'),
  Activity('Bake something', 0, 'assets/bake.jpg'),
  Activity('Re-read your favorite book', 0, 'assets/read.jpg'),
  Activity('Try out a new cusine', 0, 'assets/new_cuisine.gif'),
  Activity('Say hi to your neighbor', 0, 'assets/greet_n.jpg'),
  Activity('Go to the spa', 0, 'assets/spa.jpg'),
  Activity('Donate some clothes to goodwill', 0, 'assets/donate_clothes.jpg'),
  Activity('Volunteer at an animal shelter', 0, 'assets/shelter.jpg'),
  Activity('Go on a scavenger hunt', 0, 'assets/hunt.jpg'),
  Activity('Come up with a new recipe for dish or drink', 0, 'assets/new_dish.png'),
  Activity('Take a nap', 0, 'assets/nap.jpg'),
  Activity('Take a bath', 0, 'assets/bath.jpg'),
  Activity('Try some yoga', 0, 'assets/yoga.png'),
  Activity('Admire some flowers', 0, 'assets/flowers.png'),
  Activity('Ride a unicorn', 0, 'assets/unicorn.png'),
  Activity('Learn a new coding language', 0, 'assets/coding.jpg'),
  Activity('Dance party in your house', 0, 'assets/dancing.jpg'),
  Activity('Play hide and seek with a friend', 0, 'assets/hiding.jpg'),
  Activity('Build a box fort', 0, 'assets/box_fort.jpg'),
  Activity('Dust off your guitar', 0, 'assets/guitar.jpg'),


];
