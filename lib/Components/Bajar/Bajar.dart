import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bajar extends StatefulWidget {
  @override
  _BajarState createState() => _BajarState();
}

class _BajarState extends State<Bajar>{ 

  TextEditingController searchController;
  bool isSearching = false;

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
        itemCount:20,
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
                    Text('ITEM',
                    style: TextStyle(fontSize: 25),),
                    Text('cost',
                    style:TextStyle(fontSize: 20)),
              //           Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Text('Nutrients & Suplements',
              //   style: TextStyle(fontSize: 15),),
              // )
                

                 ],
                 ),
                 

                  
              );
            }


          


        );
  
    }
    else {
      return GridView.builder(
              scrollDirection: Axis.vertical,
            itemCount:20,
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
                    Text('ITE',
                    style: TextStyle(fontSize: 25),),
                    Text('cost',
                    style:TextStyle(fontSize: 20)),
              //           Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Text('Nutrients & Suplements',
              //   style: TextStyle(fontSize: 15),),
              // )
                

                 ],
                 ),
                 

                  
              );
            }

          


        );
  
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: <Widget>[

            Container(
            padding: EdgeInsets.only(top: 16),
            width:MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment(-0.9, 0), 
            child: TextField(
              controller: searchController,
              decoration:(
                InputDecoration(
                  hintText: 'Search...',
                  border: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(16), 
                    )
                  )
                )
              ),
              onChanged: (String text) {
                searchSet(text);
              },
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize:20
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
          )],
      ),
);
    
  
}
}
  

  

//   searchSet (String text) {
//     if(text != '' && text != null) {
//       setState(() {
//         isSearching = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print(offers.length);
//     searchController = new TextEditingController();
//   }

  
//   List searchResults = [];
// Orientation orientation;
//   Widget searchPanel () {
//     return Expanded(
//       flex: 1,
//       child: SingleChildScrollView(
//         child: GridView.builder(
//           itemCount: searchResults.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 7
//           ),
//           itemBuilder: (BuildContext context, int index) 
//           {
//             return Card(
//               child: Padding(padding:EdgeInsets.all(5),
//               child:Text(searchResults[index]),
//               )
//                ) ;     
//           },
//         ),
//       ),
//     );
  

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child:Column(
  //       children: <Widget>[
  //         // SizedBox(height:20),
  //         Container(
  //           padding: EdgeInsets.only(top: 16),
  //           width:MediaQuery.of(context).size.width * 0.9,
  //           alignment: Alignment(-0.9, 0), 
  //           child: TextField(
  //             controller: searchController,
  //             decoration:(
  //               InputDecoration(
  //                 hintText: 'Search...',
  //                 border: new OutlineInputBorder(
  //                   borderRadius: const BorderRadius.all(
  //                     const Radius.circular(16), 
  //                   )
  //                 )
  //               )
  //             ),
  //             onChanged: (String text) {
  //               searchSet(text);
  //             },
  //             style: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //               fontSize:20
  //             ),
  //           ),
  //         ),
  //         Column(
  //           children:<Widget>[
  //             Align(
  //               alignment: Alignment(0.7,0.0),
  //               child: Text('Nutrients & Suplements',
  //               style: TextStyle(fontSize: 15),),
  //             )
  //           ]
  //         ),
  //         Container(
  //           height: MediaQuery.of(context).size.height * 0.13,
  //           width: MediaQuery.of(context).size.width * 0.9,
  //           child: ListView(
  //             scrollDirection: Axis.horizontal,
  //             children: <Widget>[
  //             Padding(
  //                 padding: EdgeInsets.all(7),
              
  //                 child: Container(
  //                 alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
          
  //                 ),
                        
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.125,
  //             ),
  //               ),
  //                Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //                   alignment: Alignment(-0.9, 0),
  //                   child: Container(
  //                     height:MediaQuery.of(context).size.height*0.1,
  //                     width:MediaQuery.of(context).size.width*0.2,
  //                     decoration: BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color:Colors.green,
  //                       border:  Border.all(
  //                         color: Colors.black,
  //                         width:MediaQuery.of(context).size.width*0.005,
  //                         style: BorderStyle.solid
  //                       ),
  //                     ),
  //                   ),
  //                 decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16)),
  //                  boxShadow: [
  //           new BoxShadow(
  //             color: Colors.red,
  //             offset: new Offset(20.0, 10.0),
  //             blurRadius: 20.0,
  //           )
  //         ],
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.125,
  //             ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  // alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.125,
  //             ),
  //               ),
  //              Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //                 alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),

  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.125,
  //             ),
  //               ),
  //                Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(

  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.125,
  //             ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height:60),
  //         Column(
  //           children:<Widget>[
  //             Align(
  //               alignment: Alignment(0.7,0.0),
  //               child: Text('Nutrients & Suplements',
  //               style: TextStyle(fontSize: 15),),
  //             )
  //           ]
  //         ),
  //         SizedBox(height:8),
  //          Container(
  //           height: MediaQuery.of(context).size.height * 0.13,
  //           width: MediaQuery.of(context).size.width * 0.9,
  //           child: ListView(
  //             scrollDirection: Axis.horizontal,
  //             children: <Widget>[
  //             Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(

  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),

  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //                Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(

  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),

  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //             ],
  //           ),
  //         ),
  //         SizedBox(height: 60),
  //         Column(
  //           children:<Widget>[
  //             Align(
  //               alignment: Alignment(0.7,0.0),
  //               child: Text('Nutrients & Suplements',
  //               style: TextStyle(fontSize: 15),),
  //             )
  //           ]
  //         ),
  //         SizedBox(height:8),
  //         Container(
  //           height: MediaQuery.of(context).size.height * 0.13,
  //           width: MediaQuery.of(context).size.width * 0.9,
  //           child: ListView(
  //             scrollDirection: Axis.horizontal,
  //             children: <Widget>[
  //             Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //                Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //               Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //              Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(

  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),
  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.13,
  //             ),
  //               ),
  //                Padding(
  //                 padding: EdgeInsets.all(7),
  //                 child: Container(

  //                     alignment: Alignment(-0.9, 0),
  //                 child: Container(
  //                   height:MediaQuery.of(context).size.height*0.1,
  //                   width:MediaQuery.of(context).size.width*0.2,
  //                   decoration: BoxDecoration(
  //                     shape: BoxShape.circle,
  //                     color:Colors.green,
  //                   ),
                
  //                 ),

  //               decoration: BoxDecoration(
  //                 shape:BoxShape.rectangle,
  //                  color:Colors.blue,
  //                  borderRadius: BorderRadius.all(Radius.circular(16))
  //                 ),
  //                 width: MediaQuery.of(context).size.width * 0.85,
  //                 height: MediaQuery.of(context).size.height * 0.3,
  //             ),
  //               ),
  //             ],
  //           ),
  //         ),
        
         
  //       ],
  //     )
  //   );
  // }
