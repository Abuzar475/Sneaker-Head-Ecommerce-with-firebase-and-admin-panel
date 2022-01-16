import 'package:flutter/material.dart';
import 'package:sneaker_head/Product_Pages.dart/product1.dart';
import 'package:sneaker_head/Product_Pages.dart/scanner.dart';
import 'package:sneaker_head/Product_Pages.dart/watch_list.dart';

import 'Product.dart';


import 'account.dart';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

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
      appBar: AppBar(title: Center(child: Text('Scanner')),
      backgroundColor: Colors.black,
      
      ),
      body: Container(),
      bottomNavigationBar: _bottomNavigation(),
      
    );
  }
   Widget _bottomNavigation() {
  return BottomNavigationBar(
    currentIndex: _currentIndex,
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined, color: Colors.grey),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.qr_code_scanner_rounded, color: Colors.red),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books_outlined, color: Colors.grey),
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
          // currentIndex: _selectedIndex,
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