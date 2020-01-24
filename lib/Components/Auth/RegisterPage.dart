import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignIn, GoogleSignInAccount;
import '../../Models/AppModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterPage extends StatefulWidget {
  final changeMode;
  RegisterPage({this.changeMode});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  TextEditingController nameController;
  TextEditingController passwordController;
  TextEditingController confirmController;
  TextEditingController emailController;
  TextEditingController ageController;
  TextEditingController heightController;
  TextEditingController weightController;
  String gender;
  int displayPicture;
  bool _isEmailFieldEnabled = true;
  String gToken;

  void registerUser() {
    if(!(nameController.text != null && nameController.text != '' &&
      emailController.text != null && emailController.text != '' &&
      passwordController.text != null && passwordController.text != '' &&
      confirmController.text != null && confirmController.text != '' &&
      ageController.text != null && ageController.text != '' &&
      gToken != null)) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Missing Details'),));
        return;
    }
    if(!(passwordController.text == confirmController.text)) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Passwords not matching'),));
      return;
    }
    double height;
    double weight;
    if(heightController.text != '' && heightController.text != null) {
      height = double.parse(double.parse(heightController.text).toStringAsFixed(2));
    }
    if (weightController.text != '' && weightController.text != null) {
      weight = double.parse(double.parse(weightController.text).toStringAsFixed(2));
    }
    GraphQLProvider.of(context).value.mutate(
      MutationOptions(document: """mutation createUser(\$name: String!, \$password: String!, \$email: String!, \$age: Int!, \$gender: String, \$displayPicture: Int, \$height: Float, \$weight: Float, \$gToken: String){
          createUser(name: \$name, password: \$password, email: \$email, age: \$age, gender: \$gender, displayPicture: \$displayPicture, height: \$height, weight: \$weight, gToken: \$gToken) {
            userId
            token
          }
        }
      """,
      variables: <String, dynamic> {
        "name": nameController.text,
        "password": passwordController.text,
        "email": emailController.text,
        "gender": gender,
        "gToken": gToken,
        "age": int.parse(ageController.text),
        "displayPicture": displayPicture,
        "height": height,
        "weight": weight
      }, fetchPolicy: FetchPolicy.noCache)).then((res) async {
        if(res.errors != null) {
          print('Error creating a new user');
          print(res.errors);
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Network Error!, Please try again later!'),));
          return;
        }
        var id = res.data['createUser']['id'];
        var token = res.data['createUser']['token'];
        ScopedModel.of<AppModel>(context).setgToken(gToken);
        ScopedModel.of<AppModel>(context).setToken(token);
        ScopedModel.of<AppModel>(context).setUserId(res.data['createUser']['id']);
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('token', token);
        preferences.setString('userId', id);
        preferences.setString('gToken', gToken);
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Welcome Aboard')));
        print('Successfully created a new user');
        print(res.data);
        Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  getGoogle () async {
    final _googleSignIn = new GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
        'https://www.googleapis.com/auth/fitness.activity.read',
        'https://www.googleapis.com/auth/fitness.blood_glucose.read',
        'https://www.googleapis.com/auth/fitness.blood_pressure.read',
        'https://www.googleapis.com/auth/fitness.body.read',
        'https://www.googleapis.com/auth/fitness.body_temperature.read',
        'https://www.googleapis.com/auth/fitness.location.read',
        'https://www.googleapis.com/auth/fitness.nutrition.read',
        'https://www.googleapis.com/auth/fitness.oxygen_saturation.read',
        'https://www.googleapis.com/auth/fitness.reproductive_health.read'
      ],
    );
    await _googleSignIn.signIn();
    await _googleSignIn.currentUser.authHeaders.then((res) {
      print('token');
      print(res['Authorization'].split(' ')[1]);
      setState(() {
        gToken = res['Authorization'].split(' ')[1];
      });
    });
    nameController.text = _googleSignIn.currentUser.displayName;
    emailController.text = _googleSignIn.currentUser.email;
    setState(() {
     _isEmailFieldEnabled = false;
    });
  }

  setGender (String gen) {
    setState(() {
      gender = gen;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    confirmController = new TextEditingController();
    ageController = new TextEditingController();
    heightController = new TextEditingController();
    weightController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    bool isFormReady = nameController.text != null && nameController.text != '' &&
      emailController.text != null && emailController.text != '' &&
      passwordController.text != null && passwordController.text != '' &&
      confirmController.text != null && confirmController.text != '' &&
      ageController.text != null && ageController.text != '' &&
      gToken != null;
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
                          child: Text('Full Name',
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
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'First Name'
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
                          child: Text('EMail',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
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
                          enabled: _isEmailFieldEnabled,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Email',
                          ),
                        ),
                      )
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
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text('Confirm Password',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
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
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextField(
                          controller: confirmController,
                          obscureText: true,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Confirm Password',
                          ),
                        ),
                      )
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
                          child: Text('Gender',
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {setGender('Male');},
                              color: gender == 'Male' ? Colors.blueAccent : Color(0xFFEFEFEF),
                              child: Text('M',
                                style: TextStyle(
                                  color: gender == 'Male' ? Colors.white : Colors.blueAccent
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {setGender('Female');},
                              color: gender == 'Female' ? Colors.pink : Color(0xFFEFEFEF),
                              child: Text('F',
                                style: TextStyle(
                                  color: gender == 'Female' ? Colors.white : Colors.pink
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {setGender(null);},
                              color: gender == null ? Colors.black : Color(0xFFEFEFEF),
                              child: Text('Skip',
                                style: TextStyle(
                                  color: gender == null ? Colors.white : Colors.black
                                ),
                              ),
                            ),
                          ],
                        )
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
                          child: Text('Age',
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
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Age'
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
                          child: Text('Height (in Cm)',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 7,
                        child: Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text('Weight (in Kg)',
                            style: TextStyle(
                              fontFamily: 'Poppins'
                            ),
                          ),
                        ),
                      )
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
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            suffixText: 'Cm',
                            hasFloatingPlaceholder: false,
                            labelText: 'Height'
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 7,
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixText: 'Kg',
                            filled: true,
                            hasFloatingPlaceholder: false,
                            labelText: 'Weight',
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: getGoogle,
                        child: Text('Get Google'),
                      )
                    ],
                  ),
                   SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
              onPressed: isFormReady ? registerUser : () {Scaffold.of(context).showSnackBar(SnackBar(content: Text('Kindly fill in all the important details'),));},
              child: Text(
                'Submit',
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
      // Center(
      //   child: Container(
      //     padding: EdgeInsets.only(top: 32, left: 24, right: 24),
      //     decoration: BoxDecoration(
      //       color: Color(0xFFF8F8F8),
      //       boxShadow: [
      //         BoxShadow(
      //           offset: Offset(6, 6),
      //           blurRadius: 6,
      //           color: Color(0xAAAAAAAA)
      //         ),
      //         BoxShadow(
      //           offset: Offset(-6, -6),
      //           blurRadius: 6,
      //           color: Color(0xFFFFFFFF)
      //         ),
      //       ],
      //       borderRadius: BorderRadius.all(Radius.circular(20))
      //     ),
      //     height: MediaQuery.of(context).size.height* 0.7,
      //     child: SingleChildScrollView(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         mainAxisSize: MainAxisSize.max,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: <Widget>[
      //           Text(
      //             'Register',
      //             style: TextStyle(
      //               color: Colors.grey,
      //               fontSize: 32
      //             ),
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: nameController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Name',
      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: emailController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Email',
      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: usernameController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Username',
      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: passwordController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Password',
      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: confirmPasswordController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Confirm Password',

      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: cityController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'City',

      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: addressController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Address',

      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(
      //             height: 20,
      //           ),
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 10),
      //             height: 40,
      //             decoration: BoxDecoration(
      //               color: Color(0xFFF8F8F8),
      //               boxShadow: [
      //                 BoxShadow(
      //                   offset: Offset(6, 6),
      //                   blurRadius: 6,
      //                   color: Color(0xAAAAAAAA)
      //                 ),
      //                 BoxShadow(
      //                   offset: Offset(-6, -6),
      //                   blurRadius: 6,
      //                   color: Color(0xFFFFFFFF)
      //                 ),
      //               ],
      //               borderRadius: BorderRadius.all(Radius.circular(20))
      //             ),
      //             child: Align(
      //               alignment: Alignment.centerLeft,
      //               child: TextField(
      //                 controller: phoneNumberController,
      //                 decoration: InputDecoration.collapsed(
      //                   hintText: 'Phone Number',

      //                 ),
      //               ),
      //             )
      //           ),
      //           SizedBox(height: 30,),
      //           RaisedButton(
      //             onPressed: registerGymOwner,
      //             child: Text('Register'),
      //           ),
      //           MaterialButton(
      //             child: Text('Login'),
      //             onPressed: () {widget.changeMode('Login');},
      //           )
      //         ],
      //       ),
      //     )
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
  }

}