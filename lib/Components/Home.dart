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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int index = 0;
  PageController homePageController;

  String gToken;
  String token;
  String userId;
  String userInfo;

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
      id: ScopedModel.of<AppModel>(context).userId;
      token: ScopedModel.of<AppModel>(context).token;
      gToken: ScopedModel.of<AppModel>(context).gToken;
      userInfo: ScopedModel.of<AppModel>(context).userInfo;
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
        if(ScopedModel.of<AppModel>(context).token == null) {
          var savedToken = preferences.getString('token');
          var savedUserId = preferences.getString('userId');
          var gToken = preferences.getString('gToken');
          ScopedModel.of<AppModel>(context).setToken(savedToken);
          ScopedModel.of<AppModel>(context).setUserId(savedUserId);
          ScopedModel.of<AppModel>(context).setgToken(gToken);
        }
      }
    });
    setData();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageController = new PageController();
    Future.delayed(Duration(milliseconds: (600)), () {
      setModel();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print('Not so Scoped');
    print(ScopedModel.of<AppModel>(context).gToken);
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
                    child: Dashboard(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Journal(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Bajar(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Friends(),
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
          ],
        )
      ),
    );
  }
}