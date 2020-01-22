import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:undraw/undraw.dart';

class Pedestal extends StatefulWidget {
  @override
  _PedestalState createState() => _PedestalState();
}

class _PedestalState extends State<Pedestal> {

  int currIndex = 0;
  PageController _pedestalPageController;
  
  Map <int, Color> textColorMap = {
    0: Colors.blue,
    1: Colors.red,
    2: Color(0xFFA9A900),
    3: Colors.pink
  };

  setIndex (e) {
    setState(() {
      currIndex = e;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pedestalPageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    color: Color(0xFFEEEEEE),
                    blurRadius: 7
                  )
                ]
              ),
              child: PageView(
                controller: _pedestalPageController,
                onPageChanged: setIndex,
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Center(
                      child: UnDraw(
                        illustration: UnDrawIllustration.progress_tracking,
                        color: Colors.blue,
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Center(
                      child: UnDraw(
                        illustration: UnDrawIllustration.user_flow,
                        color: Colors.red,
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Center(
                      child: UnDraw(
                        illustration: UnDrawIllustration.mobile_payments,
                        color: Colors.yellow,
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Center(
                      child: UnDraw(
                        illustration: UnDrawIllustration.authentication,
                        color: Colors.purpleAccent,
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        color: textColorMap[currIndex],
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/auth');
                        },
                      ),
                      Center(
                        child: Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 1,
                                color: Colors.grey,
                              ),
                              Text(
                                'Or',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ),
                      MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                        color: textColorMap[currIndex],
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/auth');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}