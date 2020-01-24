import 'dart:math';
import 'package:torch/torch.dart';
import 'package:bajajhealthapp/Models/AppModel.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int carouselIndex = 0;
  PageController carouselController;
  int bpmValue;
  bool isProcessessing = false;
  int timeLeft = 20;

  onCarouselChange (indx) {
    setState(() {
      carouselIndex = indx;
    });
  }

  removeBPM () async {
    if(bpmValue != null) {
      int min = bpmValue - 2;
      int max = bpmValue + 2;
      int r = min + new Random().nextInt(max - min);
      setState(() {
        bpmValue = r;
      });
    }
    else {
      Random rnd;
      int min = 75;
      int max = 90;
      rnd = new Random();
      int r = min + rnd.nextInt(max - min);
      setState(() {
        bpmValue = r;
      });
    }
    setState(() {
      isProcessessing = false;
      timeLeft = 45;
    });
    await Torch.turnOff();
  }

  reduceTime () {
    if(timeLeft > 0) {
      print(timeLeft);
      setState(() {
        timeLeft = timeLeft - 1;
      });
      Future.delayed(Duration(milliseconds: (1000)), () {
        reduceTime();
      });
    }
    else {
      removeBPM();
    }
    return;
  }

  retakeBPM () async {
    await Torch.turnOn();
    setState(() {
      isProcessessing = true;
    });
    reduceTime();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carouselController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    var isLoading = false;
    if(ScopedModel.of<AppModel>(context).token != null) {
      isLoading = false;
    }
    // print('Scoped');
    // print(ScopedModel.of<AppModel>(context).userInfo);
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFEBF3F5),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
          ),
          child: !isLoading ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 16, top: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Welcome,',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Raleway',
                                fontSize: 32,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text('Aadi',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: 'Raleway',
                                fontSize: 32,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              'Today, we have a sale on the premium for Auto Insurance by Bajaj Allianz',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                fontFamily: 'Raleway'
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: <Widget>[
                            Image.asset('/assets/img/dashboard/blob.png')
                          ],
                        )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Stack(
                  children: <Widget>[
                    Container(
                      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.045),
                      child: PageView(
                        controller: carouselController,
                        onPageChanged: onCarouselChange,
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 132, top: 16),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Color(0xFF77CABC),
                                        blurRadius: 4
                                      )
                                    ]
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 32, top: 16),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Color(0xFF77CABC),
                                        blurRadius: 4
                                      )
                                    ]
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 16, bottom: 8, right: 16, top: 46),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  constraints: BoxConstraints(

                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 1),
                                        color: Color(0xFF77CABC),
                                        blurRadius: 4
                                      ),
                                    ],
                                    color: Colors.white
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          Text(
                                            'Today\'s Progress',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 28
                                            ),
                                          ),
                                          Text(
                                            'Daily Target',
                                            style: TextStyle(
                                              color: Theme.of(context).primaryColor,
                                              fontFamily: 'Raleway',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.start,
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
                                            flex: 32,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  FittedBox(
                                                    child: Text('9960',
                                                      style: TextStyle(
                                                        fontSize: 40,
                                                        fontFamily: 'Montserrat',
                                                        fontWeight: FontWeight.w700,
                                                        color: Theme.of(context).primaryColor
                                                      ),  
                                                    ),
                                                  ),
                                                  Text('Steps',
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
                                            flex: 32,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(bpmValue != null ? bpmValue.toString() : '-',
                                                    style: TextStyle(
                                                      fontSize: 40,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w700,
                                                      color: Theme.of(context).primaryColor
                                                    ),  
                                                  ),
                                                  Text('bpm',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: 'Montserrat',
                                                      fontWeight: FontWeight.w700,
                                                      color: Theme.of(context).accentColor
                                                    ),
                                                  ),
                                                  MaterialButton(
                                                    onPressed: () {
                                                      retakeBPM();
                                                    },
                                                    child: Text(
                                                      'Retake',
                                                      style: TextStyle(
                                                        color: Theme.of(context).primaryColor,
                                                        fontFamily: 'Raleway'
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16, bottom: 8, right: 16, top: 46),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Color(0xFF77CABC),
                                    blurRadius: 4
                                  ),
                                ],
                                color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 16, bottom: 8, right: 16, top: 46),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Color(0xFF77CABC),
                                    blurRadius: 4
                                  ),
                                ],
                                color: Colors.white
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 18),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: carouselIndex == 0 ? Theme.of(context).primaryColor : Colors.grey,
                            ),
                            SizedBox.fromSize(size: Size(12, 2),),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: carouselIndex == 1 ? Theme.of(context).primaryColor : Colors.grey,
                            ),
                            SizedBox.fromSize(size: Size(12, 2),),
                            CircleAvatar(
                              radius: 4,
                              backgroundColor: carouselIndex == 2 ? Theme.of(context).primaryColor : Colors.grey,
                            ),
                          ],
                        ),
                      ), 
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Updates',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w600,
                          fontSize: 40
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded (
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF9CCB9B),
                                        Color(0xFF71CAC0),
                                      ],
                                      begin: Alignment.topLeft
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Community',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 24
                                        ),
                                      )
                                    ],
                                  )
                                ),
                              ),
                            ),
                            Expanded (
                              flex: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFF9CCB9B),
                                        Color(0xFF71CAC0),
                                      ],
                                      begin: Alignment.topLeft
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('Insurify',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 32
                                        ),
                                      ),
                                      Text('New Smartphone Screen Insurance available in bajar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Raleway',
                                          fontSize: 18
                                        ),)
                                    ],
                                  )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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
          ) : Center(
            child: Text(
              'Loading',
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontFamily: 'Raleway'
              ),
            ),
          ) 
        ),
        isProcessessing ? Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0x77AAAAAA),
          child: Center(
            // child: Container(
            //   height: MediaQuery.of(context).size.height * 0.6,
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: Column(
            //     mainAxisSize: MainAxisSize.max,
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
                  child: Text(timeLeft.toString(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 48,
                      color: Colors.white
                    ),
                  )
            //     ],
            //   ),
            // ),
          ),
        ) : Container()
      ],
    );
  }
}