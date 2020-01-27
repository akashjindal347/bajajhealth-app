import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Journal extends StatefulWidget {
  final changePane;
  final changeDietType;
  Journal({this.changePane, this.changeDietType});
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {

  int dietTime = 0;

  changeFoodTime (int selection) {
    setState(() {
      dietTime = selection;
    });
    widget.changeDietType(selection);
  }

  addDiet () {
    GraphQLProvider.of(context).value.query(
      QueryOptions(document: """
        query addDiet () {
          mutation addDiet () {

          }
        }
      """)
    ).then((res) async {
      if(res.errors != null) {
        print('Error adding the diet data: ');
        print(res.errors);
        return;
      }
      else {
        print('Success adding the data: ');
        print(res.data);
        // SharedPreferences preferences = await SharedPreferences.getInstance();
        // preferences.setString('userInfo', json.encode(res.data));
        // ScopedModel.of<AppModel>(context).setUserInfo(res.data);
        // var savedToken = preferences.getString('token');
        // var savedUserId = preferences.getString('userId');
        // var gToken = preferences.getString('gToken');
        // if(ScopedModel.of<AppModel>(context).token == null) {
        // print('GTOKEN');
        // print(gToken);
        // print(savedToken);
        // print(savedUserId);
        // ScopedModel.of<AppModel>(context).setToken(savedToken);
        // ScopedModel.of<AppModel>(context).setUserId(savedUserId);
        // ScopedModel.of<AppModel>(context).setgToken(gToken);
      }
    });
  }

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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 32,
                        child: Container(
                          padding: EdgeInsets.all(8),
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
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).accentColor
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF77CABC),
                                offset: Offset(0, 2),
                                blurRadius: 4
                              )
                            ]
                          ),
                          width: 4,
                          height: MediaQuery.of(context).size.height * 0.125,
                        ),
                      ),
                      Expanded(
                        flex: 32,
                        child: Container(
                          padding: EdgeInsets.all(8),
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
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).accentColor
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF77CABC),
                                offset: Offset(0, 2),
                                blurRadius: 4
                              )
                            ]
                          ),
                          width: 4,
                          height: MediaQuery.of(context).size.height * 0.125,
                        ),
                      ),
                      Expanded(
                        flex: 32,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('96.0',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor
                                ),  
                              ),
                              Text('bpm',
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
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.90,
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(32)),
                            border: Border.all(
                              color: Colors.white,
                              width: 5
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 15,
                                color: Color(0x668CC598)
                              )
                            ],
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
                                  Text('Add Clinical Data to gain extra reward points',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text('Diet',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Raleway'
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFAB87CE),
                                Color(0xFFF95BBE),
                              ],
                              begin: Alignment.bottomLeft
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 15,
                                color: Color(0x668CC598)
                              )
                            ],
                            border: dietTime == 0 ? Border.all(
                              width: 5,
                              color: Colors.white
                            ) : null
                          ),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.125,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('690' + ' cal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16
                                ),
                              ),
                              Text('Breakfast',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {changeFoodTime(0);},
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFDA67A),
                                Color(0xFFFED891),
                              ],
                              begin: Alignment.bottomLeft
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 15,
                                color: Color(0x668CC598)
                              )
                            ],
                            border: dietTime == 1 ? Border.all(
                              width: 5,
                              color: Colors.white
                            ) : null
                          ),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.125,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('690' + ' cal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16
                                ),
                              ),
                              Text('Lunch',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {changeFoodTime(1);},
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF75FF77),
                                Color(0xFF32FFBE),
                              ],
                              begin: Alignment.bottomLeft
                            ),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 15,
                                color: Color(0x668CC598)
                              )
                            ],
                            border: dietTime == 2 ? Border.all(
                              width: 5,
                              color: Colors.white
                            ) : null
                          ),
                          width: MediaQuery.of(context).size.width * 0.275,
                          height: MediaQuery.of(context).size.height * 0.125,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('690' + ' cal',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat',
                                  fontSize: 16
                                ),
                              ),
                              Text('Dinner',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway',
                                  fontSize: 16
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {changeFoodTime(2);},
                      )
                    ],
                  ),
                  dietTime == 0 ? Text(
                    'Breakfast',
                    style: TextStyle(
                      color: Color(0xFF9B51E0),
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    ),
                  ) : dietTime == 1 ? Text(
                    'Lunch',
                    style: TextStyle(
                      color: Color(0xFFFEB681),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway',
                      fontSize: 20
                    ),
                  ) : Text(
                    'Dinner',
                    style: TextStyle(
                      color: Color(0xFF51FF84),
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Raleway',
                      fontSize: 20
                    ),
                  ),
                  Table(
                    columnWidths: {
                      0: FractionColumnWidth(0.4),
                      1: FractionColumnWidth(0.1),
                      2: FractionColumnWidth(0.2),
                      3: FractionColumnWidth(0.3),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text('Name',
                            style: TextStyle(
                              fontFamily: 'Raleway'
                            ),  
                          ),
                          Text('X',
                            style: TextStyle(
                              fontFamily: 'Raleway'
                            ),
                          ),
                          Text('Quantity',
                            style: TextStyle(
                              fontFamily: 'Raleway'
                            ),
                          ),
                          Text('Calories',
                            style: TextStyle(
                              fontFamily: 'Raleway'
                            ),
                          )
                        ]
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          widget.changePane('addDiet');
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          size: 24,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(right: 16, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Text(
                      'Watch a video on insurance awareness to earn extra points',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color(0xFF5B5D5D)
                      ),
                    ),
                  ),
                  Icon(
                    Icons.play_circle_outline,
                    size: MediaQuery.of(context).size.height * 0.045,
                    color: Color(0xFF5B5D5D),
                  )
                ],
              )
            ),
          ),
        ],
      )
    );
  }
}