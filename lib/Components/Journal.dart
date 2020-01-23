import 'package:flutter/material.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(
                      'Progress Journal',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Raleway'
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('Jump to date',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      Text('23rd January 2020',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          fontWeight: FontWeight.w800
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.29,
                          maxWidth: MediaQuery.of(context).size.width * 0.29
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('1670',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor
                              ),  
                            ),
                            Text('Calories Consumed',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).accentColor
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 3,
                              color: Color(0xFF77CABC)
                            )
                          ]
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.29,
                          maxWidth: MediaQuery.of(context).size.width * 0.29
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('1670',
                              style: TextStyle(
                                fontSize: 40,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor
                              ),  
                            ),
                            Text('Calories Consumed',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).accentColor
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
                          border: Border.all(
                            color: Colors.white,
                            width: 5
                          ),
                          color: Color(0xB0FFFFFF)
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('Add Clinical Data',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      )
    );
  }
}