import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  final changePane;
  final challenges;
  final setBP;
  Friends({this.changePane, this.challenges, this.setBP});
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {

  String challengeSelection = 'Ongoing';
  bool doStuff = false;
  changeChallengeSelection (String selection) {
    setState(() {
      challengeSelection = selection;
    });
    if(challengeSelection == 'Completed') {
      doStuff = true;
    }
    widget.setBP('4000 BP');
    Future.delayed(Duration(milliseconds: (2500)), () {
      setState(() {
        doStuff = false;
      });
    });
  }

  Widget gotStuff () {
    return doStuff ? Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0x77797979),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          child: Center(
            child: Text('500 BP added to your account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Montserrat'
              ),
            ),
          ),
        ),
      ),
    ) : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8, left: 16),
                child: Text('Friends',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.24,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 5
                        ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(48), topRight: Radius.circular(16)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Aditya',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Muskan',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Arushi',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Dhawal',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                              TableRow(
                                children: [
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Ninja',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Rohit',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Akash',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                            '/assets/display.jpg',
                                          ),
                                          radius: 24,
                                        ),
                                        Text('Shruti',
                                          style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontFamily: 'Raleway',
                                            fontSize: 16
                                          )
                                        )
                                      ],
                                    ),
                                  ),
                                ]
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Add Friends',
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                ),
                              ),
                              Icon(
                                Icons.add_circle_outline
                              )
                            ],
                          )
                        ]
                      )
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_circle_outline,
                            color: Theme.of(context).accentColor,
                            size: 32,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {widget.changePane('addChallenge');},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text(
                                'Challenge a Friend',
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 18,
                                  fontFamily: 'Raleway'
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 16),
                child: Text(
                'New Challenges',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Raleway',
                    fontSize: 36
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.175,
                width: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xB0FFFFFF),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(16), bottomLeft: Radius.circular(16), bottomRight:  Radius.circular(16)),
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
                      ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text('Share this code and get rewards'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text('Your Code'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text('RLWYC14'),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                child: Container(
                width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -4),
                        color: Color(0x668CC598),
                        blurRadius: 4
                      ),
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(48), topRight: Radius.circular(16)),
                    color: Theme.of(context).scaffoldBackgroundColor
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 45,
                            padding: EdgeInsets.only(top: 15),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(16)),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 0),
                                        color: Color(0x668CC598),
                                        blurRadius: 5
                                      )
                                    ]
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: MaterialButton(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              'Ongoing',
                                              style: TextStyle(
                                                fontFamily: 'Raleway',
                                                fontSize: 14
                                              ),
                                            ),
                                            onPressed: () {changeChallengeSelection('Ongoing');},
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: MaterialButton(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              'Completed',
                                              style: TextStyle(
                                                fontFamily: 'Raleway',
                                                fontSize: 14
                                              ),
                                            ),
                                            onPressed: () {changeChallengeSelection('Completed');},
                                          ),
                                        )
                                      )
                                    ],
                                  ),
                                ),
                                AnimatedContainer(
                                  alignment: Alignment(-0.75,0),
                                  duration: Duration(milliseconds: 400),
                                  padding: challengeSelection == 'Completed' ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.335) : EdgeInsets.only(left: 0),
                                  child: Container(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width * 0.25,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.all(Radius.circular(16))
                                    ),
                                    child: Center(
                                      child: Text(
                                        challengeSelection == 'Ongoing' ? 'Ongoing' : 'Completed',
                                        style: TextStyle(
                                          fontFamily: 'Raleway',
                                          fontSize: 14,
                                          color: Colors.white
                                        )
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      widget.challenges.length > 0 ? Expanded(
                        flex: 1,
                        child: ListView.builder(
                        itemCount: widget.challenges.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                            child: Container(
                              padding: EdgeInsets.only(left: 16, top: 8),
                                height: MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  color: Colors.white,
                                  border: (doStuff == true && index == 0) ? Border.all(
                                    width: 5,
                                    color: Colors.yellow
                                  ) : Border.all(
                                    width: 5,
                                    color: Theme.of(context).primaryColor
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 5),
                                      color: Color(0x668CC598)
                                    )
                                  ]
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Task ' + widget.challenges[index]['name'],
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Theme.of(context).primaryColor
                                      ),
                                    ),
                                    Text(
                                      'Progess ' + widget.challenges[index]['progress'],
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Theme.of(context).primaryColor
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ) ,
                      ): Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
          gotStuff()
        ],
      ));
  }
}