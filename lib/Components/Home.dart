import 'package:bajajhealthapp/Components/Bajar/Bajar.dart';
import 'package:bajajhealthapp/Components/Elements/BottomBar.dart';
import 'package:bajajhealthapp/Components/Journal.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './Journal.dart';

import './Dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  int index = 0;
  PageController homePageController;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageController = new PageController();
  }
  
  @override
  Widget build(BuildContext context) {
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
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