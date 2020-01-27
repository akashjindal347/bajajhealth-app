import 'package:bajajhealthapp/Components/Analysis.dart';
import 'package:bajajhealthapp/Components/Bajar/Bajar.dart';
import 'package:bajajhealthapp/Components/Elements/BottomBar.dart';
import 'package:bajajhealthapp/Components/Friends.dart';
import 'package:bajajhealthapp/Components/Journal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Journal.dart';
import '../Models/AppModel.dart';
import './Dashboard.dart';
import 'dart:convert';
import './Dashsheet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int index = 0;
  PageController homePageController;

  int dietType = 0;

  changeDietType (val) {
    setState(() {
      dietType = val;
    });
  }

  String bP = '3500 BP';

  List challenges = [
    {
      "type": "Steps",
      "name": "Complete 1500 Steps",
      "progress": "1567"
    },
    {
      "type": "Calorie",
      "name": "Consume 2500 cal",
      "progress": "450"
    },
    {
      "type": "Arbitrary",
      "name": "Update Weight",
      "progress": "Nil"
    }
  ];

  List diets = [
    {
      'type': 0,
      'name': 'Aalo Parantha',
      'quantity': 63,
      'value': 2
    }
  ];

  addChallenge (obj) {
    challenges.add(obj);
  }

  addDiet (val) {
    diets.add(val);
  }

  String _selectedPane = 'UNSET';

  changePane (String newPane) {
    setState(() {
      _selectedPane = newPane;
    });
  }

  String gToken;
  String token;
  String userId;
  var userInfo;

  changeIndex (int indx) {
    setState(() {
      index = indx;
    });
    homePageController.animateToPage(indx, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  onPageChange (indx) {
    setState(() {
      index = indx;
    });
  }

  setData () {
    setState(() {
      userId = ScopedModel.of<AppModel>(context).userId;
      token = ScopedModel.of<AppModel>(context).token;
      gToken = ScopedModel.of<AppModel>(context).gToken;
      userInfo = ScopedModel.of<AppModel>(context).userInfo;
    });
  }

  setGToken (String tok) {
    setState(() {
      gToken = tok;
    });
  }

  setBP (String bp) {
    setState(() {
      bP = bp;
    });
  }

  setModel () async {
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // print('Prefered Token');
    // print(preferences.getString('token'));
    GraphQLProvider.of(context).value.query(
      QueryOptions(document: """
        query getUser {
            getUser {
              id
              name
              dateCreated
              email
              height
              weight
              bmi
              healthIndex
              status
              gToken
            }
          }
      """)
    ).then((res) async {
      if(res.errors != null) {
        print('Error getting user data: ');
        print(res.errors);
        return;
      }
      else {
        print('Success logging in: ');
        print(res.data);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('userInfo', json.encode(res.data));
        ScopedModel.of<AppModel>(context).setUserInfo(res.data);
        var savedToken = preferences.getString('token');
        var savedUserId = preferences.getString('userId');
        var savedGToken = preferences.getString('gToken');
        // if(ScopedModel.of<AppModel>(context).token == null) {
        ScopedModel.of<AppModel>(context).setToken(savedToken);
        ScopedModel.of<AppModel>(context).setUserId(savedUserId);
        ScopedModel.of<AppModel>(context).setgToken(savedGToken);
        setData();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    homePageController = new PageController();
    Future.delayed(Duration(milliseconds: (600)), () {
      setModel();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print('GTOKEN');
    print(gToken);
    print(token);
    print(userId);
    print(userInfo);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
        child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16), )
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('/assets/img/dashboard/person.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Bajaj',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                  ),
                ),
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
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.93,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(selectedIndex: index, changeIndex: changeIndex,),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.815,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
              ),
              child: PageView(
                controller: homePageController,
                onPageChanged: onPageChange,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(23)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Dashboard(setGToken: setGToken,),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Journal(changePane: changePane, changeDietType: changeDietType),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Bajar(setBP: setBP,),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Friends(changePane: changePane, challenges: challenges, setBP: setBP),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Analysis(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.625, top: MediaQuery.of(context).size.height * 0.019),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.375,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.375,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-2, 0),
                            color: Color(0x668CC598),
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Center(
                        child: Text('3000 HP',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor
                          ),
                        ),
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.275,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-2, 0),
                            color: Color(0x668CC598),
                            blurRadius: 5
                          )
                        ]
                      ),
                      child: Center(
                        child: Text(bP,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Dashsheet(selectedPane: _selectedPane, changePane: changePane, userInfo: ScopedModel.of<AppModel>(context).userInfo, addChallenge: addChallenge, dietType: dietType,)
            )
          ],
        )
      ),
    );
  }
}