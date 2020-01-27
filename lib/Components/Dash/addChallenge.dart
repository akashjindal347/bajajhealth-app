import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:math';

class AddChallenge extends StatefulWidget {

  final addChallenge;
  final changePane;
  AddChallenge({this.changePane, this.addChallenge});

  @override
  _AddChallengeState createState() => _AddChallengeState();
}

class _AddChallengeState extends State<AddChallenge> {

  String kind = 'Steps';
  List<DropdownMenuItem<String>> stepsValList = [DropdownMenuItem(child: Text('5000'), value: '5000',), DropdownMenuItem(child: Text('10000'), value: '10000',) ,DropdownMenuItem(child: Text('15000'), value: '15000',)];
  List<DropdownMenuItem<String>> caloriesValList = [DropdownMenuItem(child: Text('2500'), value: '2500',), DropdownMenuItem(child: Text('2250'), value: '2250',) ,DropdownMenuItem(child: Text('2000'), value: '2000',)];

  String stepsVal = "5000";
  String calVal = "5000";

  stepsDropChange (String str) {
    setState(() {
      stepsVal = str;
    });
  }

  calDropChange (String str) {
    setState(() {
      calVal = str;
    });
  }

  setKind(String str) {
    setState(() {
      kind = str;
    });
  }

  addChallenge () {
    Random rnd = new Random();
    if(kind == 'Steps') {
      var progress = rnd.nextInt(int.parse(stepsVal));
      var newChallenge = {
        'type': kind,
        'name': 'Complete ' + stepsVal + ' steps',
        'progress': progress
      };
      widget.addChallenge(newChallenge);
    }
    else {
      var progress = rnd.nextInt(int.parse(calVal));
      var newChallenge = {
        'type': kind,
        'name': 'Consume ' + calVal + ' calories',
        'progress': progress
      };
      widget.addChallenge(newChallenge);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: MaterialButton(
                  onPressed: () {widget.changePane('UNSET');},
                  child: Icon(
                    Icons.close,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text('Kind',
                    style: TextStyle(
                      fontFamily: 'Poppins'
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed: () {setKind('Steps');},
                      color: kind == 'Steps' ? Colors.blueAccent : Color(0xFFEFEFEF),
                      child: Text('Steps',
                        style: TextStyle(
                          color: kind == 'Steps' ? Colors.white : Colors.blueAccent
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {setKind('Calorie');},
                      color: kind == 'Calorie' ? Colors.pink : Color(0xFFEFEFEF),
                      child: Text('Calorie',
                        style: TextStyle(
                          color: kind == 'Calorie' ? Colors.white : Colors.pink
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                items: stepsValList,
                value: stepsVal,
                onChanged: stepsDropChange,
              ),
              DropdownButton(
                items: stepsValList,
                value: stepsVal,
                onChanged: calDropChange,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          RaisedButton(
            onPressed: addChallenge,
            color: Theme.of(context).primaryColor,
            child: Text(
              'ADD',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Raleway',
                fontSize: 24
              ),
            ),
          )
        ],
      ),
    );
  }
}