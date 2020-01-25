import 'package:bajajhealthapp/Models/AppModel.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final changeMode;
  LoginPage({this.changeMode});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
  }

  loginUser () {
    FocusScope.of(context).unfocus();
    GraphQLProvider.of(context).value.query(
      QueryOptions(
        document: """query loginUser(\$method: String!, \$password: String!){
          loginUser(method: \$method, password: \$password) {
            userId
            token
          }
        }
      """,
      variables: <String, dynamic> {
        "method": emailController.text,
        "password": passwordController.text
      },
      fetchPolicy: FetchPolicy.noCache)
    ).then((res) async {
      if(res.errors != null) {
        print('Error logging in the user: ');
        print(res.errors);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials'),));
      }
      else {
        String token = res.data['loginUser']['token'];
        String id = res.data['loginUser']['userId'];
        ScopedModel.of<AppModel>(context).setToken(token);
        ScopedModel.of<AppModel>(context).setUserId(id);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('token', token);
        preferences.setString('userId', id);
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isFormReady = emailController.text != null && emailController.text != '' &&
      passwordController.text != null && passwordController.text != '';
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 24),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFF7F7F7),
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(38, MediaQuery.of(context).size.height * 0.075, 38, 0),
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7)
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome to',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Poppins'
                    )
                  ),
                  Text('Bajaj Health',
                    style: TextStyle(
                      height: 0.75,
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'PT Sans'
                    )
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text('Register below to continue',
                    style: TextStyle(
                      height: 0.75,
                      fontSize: 20,
                      fontFamily: 'Poppins'
                    )
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text('Email',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Email'
                          ),
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text('Password',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Password'
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: MaterialButton(
              color: isFormReady ? Colors.pink : Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.15, vertical: 4),
              onPressed: isFormReady ? loginUser : () {Scaffold.of(context).showSnackBar(SnackBar(content: Text('Kindly fill in all the important details'),));},
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  color: Colors.white
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16))
              ),
            ),
          )
        ],
      )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

}