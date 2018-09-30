import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
List<Category> myInterests =[];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
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
      home: new ChooseInterests(title: 'Try something new'),
    );
  }
}

class SuggestActivity extends StatefulWidget {
  SuggestActivity({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SuggestActivityState createState() => new _SuggestActivityState();
}

class _SuggestActivityState extends State<SuggestActivity> {

  String activity = "Click the button to generate a random activity";
  String picture = 'assets/press_button.gif';

  void chooseRandomActivity() {
    final _random = new Random();
    setState(() {
      List<Activity> filteredActivities =[];
      for(Activity act in _activities) {
        if(myInterests.contains(act.category)) {
          filteredActivities.add(act);
        }
      }
      if(filteredActivities.isNotEmpty) {
        Activity selectedActivity = filteredActivities[_random.nextInt(
            filteredActivities.length)];
        activity = selectedActivity.title;
        picture = selectedActivity.picture;
      } else {
        throw new Exception("Please select some interests");
      }
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
        // Here we take the value from the SuggestActivity object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(picture),
            new Text(
              'Try this out:',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                  color: Colors.purple,
              ),
            ),
            new Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
                child: new Text(
                    activity,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blue,
                    ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: chooseRandomActivity,
        tooltip: 'Display random activity',
        child: new Icon(Icons.android),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ChooseInterests extends StatefulWidget {
  ChooseInterests({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ChooseInterestsState createState() => new _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests> {

  bool eating = false;
  bool relax=false;
  bool volunteer=false;
  bool social = false;
  bool cooking = false;
  bool reading = false;
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
        // Here we take the value from the SuggestActivity object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'What are you interested in?',
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                fontFamily: 'Roboto',
                color: Colors.purple,
              ),
            ),
            new Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
                child: new CheckboxListTile(value: eating, onChanged:(bool newValue){
                  setState(() {
                    eating = newValue;
                    if(eating) {
                      myInterests.add(Category.EATING);
                    } else {
                      myInterests.remove(Category.EATING);
                    }
                  });
                }, title: new Text('Eating')),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
              child: new CheckboxListTile(value: relax, onChanged:(bool newValue){
                 setState(() {
                   relax = newValue;
                   if(relax) {
                     myInterests.add(Category.RELAX);
                   } else {
                     myInterests.remove(Category.RELAX);
                   }
                 });
                }, title: new Text('Relax')),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
              child: new CheckboxListTile(value: reading, onChanged:(bool newValue){
                setState(() {
                  reading = newValue;
                  if(reading) {
                    myInterests.add(Category.READING);
                  } else {
                    myInterests.remove(Category.READING);
                  }
                });
            }, title: new Text('Reading')),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
              child: new CheckboxListTile(value: cooking, onChanged:(bool newValue){
                setState(() {
                  cooking = newValue;
                  if(cooking) {
                    myInterests.add(Category.COOKING);
                  } else {
                    myInterests.remove(Category.COOKING);
                  }
                });
              },  title: new Text('Cooking')),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
              child: new CheckboxListTile(value: social, onChanged:(bool newValue){
                setState(() {
                  social = newValue;
                  if(social) {
                    myInterests.add(Category.SOCIAL);
                  } else {
                    myInterests.remove(Category.SOCIAL);
                  }
                });
              },  title: new Text('Social')),
            ),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 19.0),
              child: new CheckboxListTile(value: volunteer, onChanged:(bool newValue){
                setState(() {
                  volunteer = newValue;
                  if(volunteer) {
                    myInterests.add(Category.VOLUNTEER);
                  } else {
                    myInterests.remove(Category.VOLUNTEER);
                  }
                });
              },  title: new Text('Volunteer')),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SuggestActivity(title: 'Try something new')),
          );
        },
        tooltip: 'Display random activity',
        child: new Icon(Icons.arrow_right),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Activity {
  String title;
  int frequency;
  String picture;
  Category category;
  Activity(String title, int frequency, String picture, Category category) {
    this.title = title;
    this.frequency = frequency;
    this.picture = picture;
    this.category = category;
  }
}

enum Category {
  READING,
  SOCIAL,
  COOKING,
  VOLUNTEER,
  PUZZLES,
  RELAX,
  EATING
}

List<Activity> _activities = <Activity>[
  Activity('Sun bathing', 0, 'assets/sunbathing.jpg', Category.RELAX),
  Activity('Call an old friend', 0, 'assets/call_friend.jpg', Category.SOCIAL),
  Activity('Bake something', 0, 'assets/bake.jpg', Category.COOKING),
  Activity('Re-read your favorite book', 0, 'assets/read.jpg', Category.READING),
  Activity('Try out a new cusine', 0, 'assets/new_cuisine.gif', Category.EATING),
  Activity('Say hi to your neighbor', 0, 'assets/greet_n.jpg', Category.SOCIAL),
  Activity('Go to the spa', 0, 'assets/spa.jpg', Category.RELAX),
  Activity('Donate some clothes to goodwill', 0, 'assets/donate_clothes.jpg', Category.VOLUNTEER),
  Activity('Volunteer at an animal shelter', 0, 'assets/shelter.jpg', Category.VOLUNTEER),
  Activity('Go on a scavenger hunt', 0, 'assets/hunt.jpg', Category.PUZZLES),
  Activity('Come up with a new recipe for dish or drink', 0, 'assets/new_dish.png', Category.COOKING),
  Activity('Take a nap', 0, 'assets/nap.jpg', Category.RELAX),

];
