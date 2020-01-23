import 'package:flutter/material.dart';

class Bajar extends StatefulWidget {
  @override
  _BajarState createState() => _BajarState();
}

class _BajarState extends State<Bajar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[

          SizedBox(height:20),

          Align(
            alignment:Alignment(-0.5, 0.0),
            child: Text('Search...',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize:40 
              ),
            )
          ),

          SizedBox(height: 60),

         Column(children:<Widget>[
          Align(
            alignment: Alignment(0.7,0.0),
            child: Text('Nutrients & Suplements',
            style: TextStyle(fontSize: 15),),
          )]),

          SizedBox(height:8),
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  shape:BoxShape.rectangle,
                   color:Colors.blue,
                   borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.125,
              )
            ],
          ),

          SizedBox(height:60),

          Column(children:<Widget>[
          Align(
            alignment: Alignment(0.7,0.0),
            child: Text('Nutrients & Suplements',
            style: TextStyle(fontSize: 15),),
          )]),

          SizedBox(height:8),
Row(
            children: <Widget>[
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  shape:BoxShape.rectangle,
                   color:Colors.blue,
                   borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.125,
              )
            ],
          ),

          SizedBox(height: 60),

          Column(children:<Widget>[
          Align(
            alignment: Alignment(0.7,0.0),
            child: Text('Nutrients & Suplements',
            style: TextStyle(fontSize: 15),),
          )]),

          SizedBox(height:8),
Row(
            children: <Widget>[
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  shape:BoxShape.rectangle,
                   color:Colors.blue,
                   borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.125,
              )
            ],
          ),
          
        ],)
    );
  }
}