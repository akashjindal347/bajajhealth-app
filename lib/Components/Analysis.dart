import 'package:flutter/material.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children:<Widget>[
            Expanded(
              child: Container(
                //  decoration: myBoxDecoration(),
                margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
                child: Column(
                  children :<Widget>[
                    Text(
                      'Avg. ',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Daily Steps ',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    ),
                    Text(
                      '10000',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
              width: 10.0,
              height: 140.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 2,
                    color: Color(0x668CC598)
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                color: Colors.white
              ),
            ),
            Expanded(
              flex: 1,
              child: Container( 
              //  decoration: myBoxDecoration(),  
                margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
                child: Column(
                  children :<Widget>[     
                    Text(
                      'Health ',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      'Index ',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  ),
                  Text(
                    '87',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        width: MediaQuery.of(context).copyWith().size.width/1 ,
        margin: const EdgeInsets.only(left: 10.0, right: 10.0,bottom:20.0),
        height: 10.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: Color(0x668CC598),
              blurRadius: 5
            )
          ],
          color: Colors.white
        ),
        child: Text(''),
      ),
      Column(
        children: <Widget>[
          Center(
            child: Text(
              'Your BMI',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
          Center(
            child: Text(
              '16.7',
              style: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 25)),
      Container(
        child: Text(''),
        width: MediaQuery.of(context).copyWith().size.width/1.5,
        height: 25.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.green[500],
              Colors.yellow[700],
              Colors.orange[600],
              Colors.red[400],
            ],
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).copyWith().size.width/1.5 ,
        child: Row(
          children: <Widget>[
            Text('16', style:
              TextStyle(
                fontSize: 15.0
              )
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 110, 0),),
            Text('22', 
              style:TextStyle(
                fontSize: 15.0
              )
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 110, 0),),
            Text('28', 
              style:TextStyle(
                fontSize: 15.0
              )
            ),
          ],
        ),
      ),
      Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),),
      Center(
        child: Text('Health',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30.0,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ) 
        ),
      ),
      Center(
        child: Text('Analysis',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 30.0,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ) 
        ),
      ),
    ],
  );
}
}