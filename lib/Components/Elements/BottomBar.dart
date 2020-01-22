import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {

  final selectedIndex;
  final changeIndex;
  BottomBar({this.selectedIndex, this.changeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF089BAB)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          NavButton(index: 0, selectedIndex : selectedIndex),
          NavButton(index: 1, selectedIndex : selectedIndex),
          NavButton(index: 2, selectedIndex : selectedIndex),
          NavButton(index: 3, selectedIndex : selectedIndex),
          NavButton(index: 4, selectedIndex : selectedIndex),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {

  final int index;
  final int selectedIndex;
  NavButton({this.index, this.selectedIndex});

  Map <int, dynamic> selectionMap = {
    0 : 'Home',
    1 : 'Journal',
    2 : 'Bajar',
    3 : 'Friends',
    4 : 'Analyze'
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: selectedIndex == index ? MediaQuery.of(context).size.width * 0.15 : MediaQuery.of(context).size.width * 0.05,
      duration: Duration(milliseconds: 500),
      padding: selectedIndex == index ? EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8
      ) : EdgeInsets,
      decoration: selectedIndex == index ? BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16))
      ) : BoxDecoration(
        color: Theme.of(context).primaryColor
      ),
      child: selectedIndex == index ? Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          selectionMap[index] == 'Home' ? Icon(Icons.home, color: Theme.of(context).primaryColor) : 
          selectionMap[index] == 'Journal' ? Icon(Icons.book, color: Theme.of(context).primaryColor) : 
          selectionMap[index] == 'Bajar' ? Icon(Icons.shopping_cart, color: Theme.of(context).primaryColor) : 
          selectionMap[index] == 'Friends' ? Icon(Icons.supervised_user_circle, color: Theme.of(context).primaryColor) : 
                                          Icon(Icons.bubble_chart, color: Theme.of(context).primaryColor),
          Text(
            selectionMap[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor
            ),
          ) 
        ],
      ) : selectionMap[index] == 'Home' ? Icon(Icons.home, color: Colors.white) : 
          selectionMap[index] == 'Journal' ? Icon(Icons.book, color: Colors.white) : 
          selectionMap[index] == 'Bajar' ? Icon(Icons.shopping_cart, color: Colors.white) : 
          selectionMap[index] == 'Friends' ? Icon(Icons.supervised_user_circle, color: Colors.white) : 
                                          Icon(Icons.bubble_chart, color: Colors.white),
    );
  }
}