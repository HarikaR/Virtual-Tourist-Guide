import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SrSsTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss, \n EEE d MMM').format(now);
    String textFunction() {
      List splittedDate = formattedDate.split(':');
      if (splittedDate[0].toString() == '5')
        return "It's a nice time to see a sunrise.";
      else if (splittedDate[0].toString() == '18')
        return "It's a nice time to see a sunset.";
      else
        return "The time is just $formattedDate\n You won't find any sunrise or sunsent now :)";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 30.0,
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Text(
                      'Any sunset or sunrise points?☀️',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'AmaticSC',
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Image.asset(
                    'images/sunrise.jpg',
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    textFunction(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 40.0,
                      fontFamily: 'Inconsolata',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
