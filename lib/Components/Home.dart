import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './Dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int index;

  changeIndex (int indx) {
    setState(() {
      index = indx;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/img/branding/header.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Bajaj'),
                Text('Health Synthesizer',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: Container(
        // height: Media,
        child: Center(
          child: Text('Home',
            style: TextStyle(
              fontFamily: 'Raleway',
              color: Colors.grey,
              fontSize: 96,
            ),
          ),
        ),
      ),
    );
  }
}