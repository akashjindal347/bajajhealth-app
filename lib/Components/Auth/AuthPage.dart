import 'package:flutter/material.dart';

import './LoginPage.dart';
import './RegisterPage.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  String mode = 'Login';

  changeMode (String mde) {
    setState(() {
      mode = mde;
    });
  }

  Widget AuthSelector () {
    if(mode == 'Login') return LoginPage(changeMode: changeMode);
    return RegisterPage(changeMode: changeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AuthSelector(),
            // ConnectivityCheckGhost()
          ],
        ),
      ),
    );
  }
  
}