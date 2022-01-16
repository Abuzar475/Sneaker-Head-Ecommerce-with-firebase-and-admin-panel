import 'package:flutter/material.dart';
import 'package:sneaker_head/Product_Pages.dart/product1.dart';
import 'package:sneaker_head/Product_Pages.dart/scanner.dart';
import 'package:sneaker_head/Product_Pages.dart/watch_list.dart';

import 'Product.dart';


import 'account.dart';

class ProductPage1 extends StatefulWidget {
  @override
  _ProductPage1State createState() => _ProductPage1State();
}

class _ProductPage1State extends State<ProductPage1> {

 int _selectedIndex = 0;
  int _currentIndex= 0;
  final List<Widget> _children = [
    ProductPage(),
    Scanner(),
    ProductPage1 (),
    WatchList(),
      Account(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  _onTap() { // this has changed
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) => _children[_currentIndex])); // this has changed
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.notifications_active_outlined,
                    size: 26.0,
                  ),
                )),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  'Preview List',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
                  child: Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                color: Colors.black,
                height: 200,
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  _searchBar(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(children: [
                                    Text(
                                      '3133.33',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Total Value',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                        // SizedBox(height: 30),
                                        // Card(
                                        //     shape: RoundedRectangleBorder(
                                        //         borderRadius:
                                        //             BorderRadius.circular(
                                        //                 10)),
                                        //     // width: 320,
                                        //     // height: 120,
                                        //     color: Colors.white,
                                        //     child: Image.asset(
                                        //       'assets/capture.png',
                                        //       width: 320,
                                        //       height: 120,
                                        //     )),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                  ]),
                                ],
                              )))
                    ],
                  )
                ])),
            SingleChildScrollView(
                child: Column(children: [
              SingleChildScrollView(
                child: Container(
                    child: Column(children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: Image.asset(
                      'assets/capture.png',
                      width: 320,
                      height: 120,
                    ),
                  ),
                  Column(children: [
                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        // width: 320,
                        // height: 120,
                        color: Colors.white,
                        child: Image.asset(
                          'assets/capture1.png',
                          width: 320,
                          height: 120,
                        )),
                  ])
                ])),
              ),
              // Text(
              //   'Portfolio Collection',
              //   style: TextStyle(
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black),
              // ),
              Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Column(children: [
          Image.asset(
            'assets/capture2.png',
            width: 400,
            height: 200,
          
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
                Text('NIKE SB DUNK LOW', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                Column(children: [
                  Text('TRAVIS SCOTT (REGULAR BOX)', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Column(children: [
                    Text('SIZE 12 ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                  Column (children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      color: Colors.red,
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 150.0,
        height: 50,
        color: Colors.green,
        child: new Text('SELL',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => SignIn()))
                      //TO-DO
                    }
      ),
      ),
  Row(children: [
  Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0.0,
      color: Colors.red,
      clipBehavior: Clip.antiAlias, // Add This
      child: MaterialButton(
        minWidth: 150.0,
        height: 50,
        color: Colors.red,
        child: new Text('BUY',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: () {
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => SignIn()))
                      //TO-DO
                    }
      ),
      ),
  ],)
])
                  ],)
                ],)
                ],)
              ],),
          )
         ] ),
                
                  )]
                  
        // )
        //  ])
                  )
                  )]
                  )
        ),
        bottomNavigationBar: _bottomNavigation(),
        
        );

  }

  Widget _searchBar() {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 15.0,
          fontWeight: FontWeight.w300),
      decoration: InputDecoration(
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ), // icon is 48px widget.
          ),
          filled: true,
          contentPadding: EdgeInsets.all(20),
          hintText: "Search Your Product",
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.circular(10.0))),
    );
  }

  Widget _cardView(var image) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(children: [
          Image.asset(
            '$image',
            width: 100,
            height: 90,
          ),
        ]));
  }
   Widget _bottomNavigation() {
  return BottomNavigationBar(
    // currentIndex: _currentIndex,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, color: Colors.grey),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.qr_code_scanner_rounded, color: Colors.grey),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined, color: Colors.red),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.local_fire_department_outlined, color: Colors.grey),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle_rounded, color: Colors.grey),
      label: '',
    )
  ],
 type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          onTap: (index) {
          setState(() {
            _currentIndex = index;
             });
          _onTap();
        },
   );
   
   
    }
}
