import 'package:flutter/material.dart';
import 'package:sneaker_head/Product_Pages.dart/product1.dart';
import 'package:sneaker_head/Product_Pages.dart/scanner.dart';
import 'package:sneaker_head/Product_Pages.dart/watch_list.dart';

import 'Product.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
  final List<Widget> _children = [
    ProductPage(),
    Scanner(),
    ProductPage1(),
    WatchList(),
    Account()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _onTap() {
    // this has changed
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            _children[_currentIndex])); // this has changed
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Text(
          'Account',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
        elevation: 0.0,
      ),
      body: ListView(
        children: ListTile.divideTiles(
            //          <-- ListTile.divideTiles
            context: context,
            tiles: [
              ListTile(
                title: Text('Craig Borja'),
                subtitle: Text('View and edit profile'),
              ),
              ListTile(
                leading: (Icon(Icons.check_box_outline_blank)),
                title: Text('Buying'),
                subtitle: Text('Active Bids, In-Progress, Completed Orders'),
              ),
              ListTile(
                leading: (Icon(Icons.chrome_reader_mode_sharp)),
                title: Text('Selling'),
                subtitle: Text('Active Asks, In-Progress, Completed Sales'),
              ),
              ListTile(
                leading: (Icon(Icons.circle)),
                title: Text('Portfolio'),
                subtitle: Text('See the value of your item'),
              ),
              ListTile(
                leading: (Icon(Icons.playlist_add_rounded)),
                title: Text('Following'),
                subtitle: Text('Products you are wstching'),
              ),
              ListTile(
                leading: (Icon(Icons.book)),
                title: Text('Blog'),
              ),
              ListTile(
                leading: (Icon(Icons.help)),
                title: Text('Help'),
              ),
              ListTile(
                leading: (Icon(Icons.book_sharp)),
                title: Text('How it works'),
              ),
              ListTile(
                leading: (Icon(Icons.star_border)),
                title: Text('Reviews'),
              ),
              ListTile(
                leading: (Icon(Icons.money_off)),
                title: Text('Currence: USD'),
              ),
            ]).toList(),
      ),
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
          icon: Icon(Icons.qr_code_scanner_rounded, color: Colors.grey),
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
          icon: Icon(Icons.supervised_user_circle_rounded, color: Colors.red),
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
