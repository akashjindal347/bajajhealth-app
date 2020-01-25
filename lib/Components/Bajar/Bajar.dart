import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bajar extends StatefulWidget {
  final setBP;
  Bajar({this.setBP});
  @override
  _BajarState createState() => _BajarState();
}

class _BajarState extends State<Bajar>{ 

  TextEditingController searchController;
  bool isSearching = false;
  bool doStuff = false;

  List<String> images = ["https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any", "https://placeimg.com/500/500/any"];


  List<Map <String, dynamic>> offers = [
    {
      'backImg': '',
      'name':['eqrqrq3r','wfqwfQFW','FQfqFQfqFqf','ffqEFQefqEFF','WFQEFEFQEFQEFEFQEF'],
      'reqHP': '',
      'description': ''
    }
  ];

  void list_items(String backImg,){

  }
  

  searchSet (String text) {
    if(text != '' && text != null) {
      setState(() {
        isSearching = true;
      });
    }
  }

  buy() {
    setState(() {
      doStuff = true;
    });
    widget.setBP('3000 BP');
    Future.delayed(Duration(milliseconds: (2500)), () {
      setState(() {
        doStuff = false;
      });
    });
  }

  
  String challengeSelection = 'Ongoing';
  int grid=0;

  changeChallengeSelection (String selection) {
    setState(() {
      challengeSelection = selection;
    });
  }

  changeGrid(int gridselected){
    setState((){
         grid= gridselected;
    });
  }

  Widget GridSelector () {
    if (grid == 1) {
      return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount:2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing:10),
        itemBuilder: (BuildContext context, int index){
          return MaterialButton(
            padding: EdgeInsets.all(0),
            onPressed: buy,
            child: Container(
            decoration: BoxDecoration(
              shape:BoxShape.rectangle,
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    color: Color(0x668CC598),
                    blurRadius: 5
                  )
                ]
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                  ),
                  Text(
                    (index == 0) ? 'Mobile Insurance' : 'Health Insurance',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Raleway'
                    ),
                  ),
                  Text(
                    (index == 0) ? '1000' : '5000',
                    style:TextStyle(fontSize: 20)
                  ),
                ],
              ),      
            )
          );
        }
      );
    }
    else {
      return GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount:2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing:10),
        itemBuilder: (BuildContext context, int index){
          return Container(
            decoration: BoxDecoration(
              shape:BoxShape.rectangle,
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Color(0x668CC598),
                  blurRadius: 5
                )
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                ),
                Text(
                  (index == 0) ? 'ProteinBar' : 'MuscleBlaze',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  (index == 0) ? '1500' : '500',
                  style:TextStyle(fontSize: 20)
                ),
              ],
            ),
          );
        }
      );
    }
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
            child: Text('Bought the insurance',
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
    return Stack(
      children: <Widget>[
        Container(
          child:Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 16),
                width:MediaQuery.of(context).size.width * 0.9,
                alignment: Alignment(-0.9, 0),
                child: Text(
                  'Bajaj Market',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontSize: 32
                  ),
                ),
              ),
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
                                flex:1 ,
                                child: Center(
                                  child: MaterialButton(
                                    child: Text(
                                      'Products',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 14
                                      ),
                                    ),
                                    onPressed: () {changeChallengeSelection('Products');
                                                    changeGrid(0);},
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: MaterialButton(
                                    child: Text(
                                      'Insurance',
                                      style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontSize: 14
                                      ),
                                    ),
                                    onPressed: () {changeChallengeSelection('Insurance');
                                                    changeGrid(1);},
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          alignment: Alignment(-0.75,0),
                          duration: Duration(milliseconds: 500),
                          padding: challengeSelection == 'Insurance' ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.335) : EdgeInsets.only(left: 0),
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(16))
                            ),
                            child: Center(
                              child: Text(
                                challengeSelection == 'Products' ? 'Products' : 'Insurance',
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
              SizedBox(height: 10),          
              Container(
                height: MediaQuery.of(context).size.height *0.65,
                width: MediaQuery.of(context).size.width * 0.9, 
                child: GridSelector()
              )
            ],
          ),
        ),
        gotStuff()
      ],
    );
  }
}