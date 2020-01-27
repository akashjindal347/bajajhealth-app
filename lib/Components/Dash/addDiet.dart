import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AddDiet extends StatefulWidget {

  final changePane;
  final addDiet;
  final dietType;
  AddDiet({this.changePane, this.addDiet, this.dietType});

  @override
  _AddDietState createState() => _AddDietState();
}

class _AddDietState extends State<AddDiet> {

  String kind = 'Steps';
  TextEditingController quantityController;
  // List
  List<DropdownMenuItem<String>> foodNameList = [DropdownMenuItem(child: Text('Select'), value: null,), DropdownMenuItem(child: Text('Samosa'), value: '262',), DropdownMenuItem(child: Text('Aalo Parantha'), value: '326',) ,DropdownMenuItem(child: Text('Palak Paneer'), value: '183',)];
  
  String foodSelect;

  foodChange (String str) {
    setState(() {
      foodSelect = str;
    });
  }

  add () {
    print({
      'type': widget.dietType,
      'name': foodSelect,
      'quantity': int.parse(quantityController.text),
      'value': foodSelect
    });
    // widget.addDiet({
    //   'type': widget.dietType,
    //   'name': foodSelect,
    //   'quantity': int.parse(quantityController.text),
    //   'value': foodSelect
    // });
  }

  @override
  void initState() {
    super.initState();
    quantityController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: MaterialButton(
                  onPressed: () {widget.changePane('UNSET');},
                  child: Icon(
                    Icons.close,
                    size: 30,
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
                child: Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text('Food',
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
                  child: Text('Quantity',
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
                child: DropdownButton(
                  onChanged: foodChange,
                  value: foodSelect,
                  items: foodNameList,
                )
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 7,
                child: TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    hasFloatingPlaceholder: false,
                    labelText: 'Quantity',
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
                child: Text('Add'),
                onPressed: add,
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    quantityController.dispose();
  }

}