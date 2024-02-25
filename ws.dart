import 'package:flutter/material.dart';

void main() {
  runApp(SakhiApp());
}

class SakhiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sakhi: #GiveHerConfidence',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Sakhi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SakhiBotScreen()),
                );
              },
              child: Text('Chat with SakhiBot'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorsAndPharmaciesScreen()),
                );
              },
              child: Text('Find Nearby Doctors & Pharmacies'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeriodTrackerScreen()),
                );
              },
              child: Text('Period Tracker'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataCollectionScreen()),
                );
              },
              child: Text('Data Collection & Analysis'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationalVideosScreen()),
                );
              },
              child: Text('Informational Videos'),
            ),
          ],
        ),
      ),
    );
  }
}

class SakhiBotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SakhiBot'),
      ),
      body: Center(
        child: Text('Welcome to SakhiBot!'),
      ),
    );
  }
}

