import 'package:flutter/material.dart';

void main() => runApp(MyApp());

BoxDecoration myBoxDecoration(){
   return BoxDecoration(
    //  color: Colors.white,
    // border: Border.all(
     
    //     width: 1.0,
    //   ),
    
    borderRadius: BorderRadius.all(
        Radius.circular(5.0) ,//         <--- border radius here
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      backgroundColor: Color(0xFFe2f7f3),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Row(
             children:<Widget>[
               Expanded(
                //  flex: 1,
               child: Container( 

                //  width: MediaQuery.of(context).copyWith().size.width / 2.5,
                //  height:MediaQu ery.of(context).copyWith().size.height / 6,
                 decoration: myBoxDecoration(),  
                //  color: Colors.green,
                      margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
                 child: Column(
                 children :<Widget>[
                   
                   Text(
                     'Avg. ',
                     style: TextStyle(
                       fontSize: 30.0,
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF32d6b4),

                     ),
                     ),
                     Text(
                     'Daily Steps ',
                     style: TextStyle(
                       fontSize: 30.0,
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF32d6b4),
                     ),
                     ),
                     Padding(
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                     ),
                   Text(
                     '10000',
                     style: TextStyle(
                       fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
            
             ],
             ),
             ),
               ),

               Container(
                margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),

                 width: 10.0,
                 height: 140.0,
                 child: Text(''),
                //  color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  color: Colors.white
                ),
               ),

              Expanded(
                 flex: 1,
               child: Container( 

                //  width: MediaQuery.of(context).copyWith().size.width / 2.5,
                //  height:MediaQu ery.of(context).copyWith().size.height / 6,
                 decoration: myBoxDecoration(),  
                //  color: Colors.green,
                      margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
                     child: Column(
                 children :<Widget>[
                   
                   Text(
                     'Health ',
                     style: TextStyle(
                       fontSize: 30.0,
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF32d6b4),

                     ),
                     ),
                     Text(
                     'Index ',
                     style: TextStyle(
                       fontSize: 30.0,
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF32d6b4),
                     ),
                     ),
                     Padding(
                       padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                     ),
                   Text(
                     '87',
                     style: TextStyle(
                       fontSize: 22.0,
                       fontWeight: FontWeight.bold,
                     ),
                   ),
            
             ],
             ),
             ),
               ),
             
             ],
           ),

           Container(
             width: MediaQuery.of(context).copyWith().size.width/1 ,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0,bottom:20.0),
            height: 10.0,

             decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  color: Colors.white
                ),
             child: Text(''),
           ),

           Column(
             children: <Widget>[Center(
               child: Text(
                 'Your BMI',
                 style: TextStyle(
                   fontSize: 30.0,
                   fontWeight: FontWeight.bold,
                   color: Color(0xFF32d6b4),
                 ),),
             ),
             Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 15)),
             Center(
               child: Text(
                 '16.7',
                 style: TextStyle(
                   fontSize: 22.0,
                   fontWeight: FontWeight.bold,
                   
                 ),),
             ),

             ],
           ),
           Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 25)),

           Container(
             child: Text(''),
             width: MediaQuery.of(context).copyWith().size.width/1.5,
             height: 25.0,
             decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.green[500],
            Colors.yellow[700],
            Colors.orange[600],
            Colors.red[400],
          ],
        ),
      ),
           ),

          Container(
             width: MediaQuery.of(context).copyWith().size.width/1.5 ,
            child: Row(
              children: <Widget>[
                Text('16', style:TextStyle(
                  fontSize: 15.0
                )),
                Padding(padding: EdgeInsets.fromLTRB(0, 0, 110, 0),),
               Text('22', style:TextStyle(
                  fontSize: 15.0
                )),
               Padding(padding: EdgeInsets.fromLTRB(0, 0, 110, 0),),

               Text('28', style:TextStyle(
                  fontSize: 15.0
                )),
               
              ],
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 30),),

          Center(
            child: Text('Health',
            style: TextStyle(
              fontSize: 30.0,
             color: Color(0xFF32d6b4),
             fontWeight: FontWeight.bold,

            ) 
            ),
          ),
           Center(
            child: Text('Analysis',
            style: TextStyle(
              fontSize: 30.0,
             color: Color(0xFF32d6b4),
             fontWeight: FontWeight.bold,

            ) 
            ),
          ),
             
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
