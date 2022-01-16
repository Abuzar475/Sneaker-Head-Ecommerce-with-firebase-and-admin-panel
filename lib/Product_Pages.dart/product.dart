import 'package:flutter/material.dart';
import 'package:sneaker_head/Colors.dart';
import 'package:sneaker_head/FireBase_Service/Store.dart';
import 'package:sneaker_head/Models/Product.dart';
import 'package:sneaker_head/Product_Pages.dart/product1.dart';
import 'package:sneaker_head/Product_Pages.dart/scanner.dart';
import 'package:sneaker_head/Product_Pages.dart/watch_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_head/provider/cartItem.dart';
import 'account.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _quantity = 1;
  final _store = Store();
  List<Product> _products;
  QuerySnapshot data;
  int _currentIndex = 0;
  int _selectedIndex = 0;
  final List<Widget> _children = [
    ProductPage(),
    Scanner(),
    ProductPage1(),
    WatchList(),
    Account(),
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

  @override
  void initState() {
    // _store.getData().then((results) {
    //     data = results;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context).settings.arguments;

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
            Text(
              'Portfolio Collection',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            productView(),
          ]))
        ]),
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
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.red),
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

  Widget productView() {
    //Product product = ModalRoute.of(context).settings.arguments;
    // product = Product(
    //     pCategory: "pCat",
    //     pDescription: "PDes",
    //     pId: "pI",
    //     pLocation: "Ploc",
    //     pName: "Pname",
    //     pPrice: "dfd",
    //     pQuantity: 5);
    return FutureBuilder(
      builder: (context, AsyncSnapshot<QuerySnapshot> projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          return Container();
        }
        print("*****Data : ${projectSnap.data.size}");
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: projectSnap.data.size,
            itemBuilder: (context, index) {
              QueryDocumentSnapshot project = projectSnap.data.docs[index];
              List<Product> products = [];
              for (var project in projectSnap.data.docs) {
                //var data = project.data;
                products.add(Product(
                    pId: project.id,
                    pPrice: project['productPrice'],
                    pName: project['productName'],
                    pDescription: project['productDescription'],
                    pLocation: project['productLocation'],
                    pCategory: project['productCategory']));
              }
              print('product length : ${products[0].pName}');
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                // child: SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child:
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => WatchList()));
                                  },
                                  child: Image.network(
                                    "${project['productLocation']}",
                                    width: 100,
                                    height: 90,
                                  ),
                                ),
                              ])),
                      Column(children: [
                        Text(
                          "${project['productName']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${project['productDescription']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${project['productPrice']}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]),
                      Column(
                        children: [
                          // cartButton(),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart_outlined),
                            onPressed: () {
                              print("[addTocart]: ${products[index].pName}");
                              addToCart(context, products[index]);
                              //GestureDetector(onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => WatchList()));
                              //});
                            },
                          )
                        ],
                      )
                    ]),
              );
            });
      },
      future: _store.getData(),
    );
  }

  void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    cartItem.addProduct(product);
  }
}
