import 'package:flutter/material.dart';
import './Dash/addFriend.dart';
import './Dash/addChallenge.dart';
import './Dash/addDiet.dart';
import './Dash/sure.dart';

class Dashsheet extends StatefulWidget {
  final String selectedPane;
  final changePane;
  final userInfo;
  final addChallenge;
  final addDiet;
  final dietType;
  Dashsheet({this.selectedPane, this.changePane, this.userInfo, this.addChallenge, this.addDiet, this.dietType});
  @override
  _DashsheetState createState() => _DashsheetState();
}

class _DashsheetState extends State<Dashsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xAA676767),
      height: widget.selectedPane == 'UNSET' ? 0 : MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          AnimatedContainer(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -6),
                  blurRadius: 5,
                  color: Color(0xAA676767)
                )
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32))
            ),
            height: widget.selectedPane == 'UNSET' ? 0 : MediaQuery.of(context).size.height * 0.65,
            duration: Duration(milliseconds: 500),
            child: widget.selectedPane == 'addChallenge' ? AddChallenge(changePane: widget.changePane, addChallenge: widget.addChallenge) : 
                    // widget.selectedPane == 'addFriend' ? AddFriend() : 
                    widget.selectedPane == 'addDiet' ? AddDiet(changePane: widget.changePane, addDiet: widget.addDiet, dietType: widget.dietType) :
                    // widget.selectedPane == 'addChallenge' ? AddChallenge() :
                    // widget.selectedPane == 'addChallenge' ? AddChallenge() : 
                    // widget.selectedPane == 'addChallenge' ? AddChallenge() : 
                  //  widget.selectedPane == 'addChallenge' ? AddGym(changeSheetMode: widget.changeSheetMode, setData: widget.setData,) : 
                  //  widget.selectedPane == 'addDiet' ? AddPlan(changeSheetMode: widget.changeSheetMode, userInfo: widget.userInfo, setData: widget.setData) : 
                  //  widget.selectedPane == 'sure' ? MarkAttendance(changeSheetMode: widget.changeSheetMode, setData: widget.setData, gymId: widget.payload['gymId'], userId: widget.payload['userId']) :
                   Container(),
          )
        ],
      )
    );
  }
}