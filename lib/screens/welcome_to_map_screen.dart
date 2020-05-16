import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vtg1flutter/components/rounded_button.dart';
import 'package:vtg1flutter/screens/exploreScreen.dart';
import 'package:vtg1flutter/screens/how_long_screen.dart';

import 'package:vtg1flutter/screens/map_screen1.dart';
import 'package:vtg1flutter/screens/notify_sr_ss_screen.dart';
import 'package:vtg1flutter/screens/weather_screen.dart';
import 'package:vtg1flutter/services/weather.dart';

const apiKey = 'd413160d418036107043c25088ff10cc';

class WelcomeToMapScreen extends StatefulWidget {
  static const String id = 'welcome_to_map_screen';

  @override
  _WelcomeToMapScreenState createState() => _WelcomeToMapScreenState();
}

class _WelcomeToMapScreenState extends State<WelcomeToMapScreen> {
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherScreen(
          locationWeather: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            RoundedButton(
              title: 'Weather',
              colour: Colors.blueAccent,
              onPressed: () {
                getLocationData();
              },
            ),
            Text(
              'Know what you can do with the given weather conditions in your location.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Explore',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return MapScreen1();
                  }),
                );
              },
            ),
            Text(
              'You can know about the nearby tourist attractions (landmarks and monuments), if any.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Know More',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ExploreScreen();
                  }),
                );
              },
            ),
            Text(
              'Search a place and you will know what it is all about.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                //fontFamily: 'AmaticSC',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'When should you visit?',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SrSsTime();
                  }),
                );
              },
            ),
            Text(
              "Enter the name of the place and you'll know the perfect time to visit it(if any)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                //fontFamily: 'AmaticSC',
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'How Long?',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    //return SearchTry1();
                    return SearchBarWidget();
                  }),
                );
              },
            ),
            Text(
              "Do you have enough time to cover that area? To know more click on the 'How Long?' button.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 15.0,
                //fontFamily: 'AmaticSC',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
