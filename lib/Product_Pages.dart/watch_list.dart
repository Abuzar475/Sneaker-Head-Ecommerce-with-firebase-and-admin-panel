import 'package:flutter/material.dart';
import 'package:sneaker_head/Models/Product.dart';
import 'package:sneaker_head/Product_Pages.dart/product1.dart';
import 'package:sneaker_head/Product_Pages.dart/scanner.dart';
import 'package:sneaker_head/Product_Pages.dart/watch_list.dart';
import 'package:sneaker_head/provider/cartItem.dart';
import 'package:provider/provider.dart';
import 'Product.dart';
import 'account.dart';

class WatchList extends StatefulWidget {
  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  int _selectedIndex = 0;
  int _currentIndex = 0;
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
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    print('$products');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Center(
            child: Text(
          'Watch list',
          textAlign: TextAlign.center,
        )),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          // LayoutBuilder(builder: (context, constrains) {
          //   if (products.isNotEmpty) {
          //     Container(
          //       child:
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                products[index].pLocation,
                                width: 100,
                                height: 90,
                              ),
                            ])),
                    Column(children: [
                      Text(
                        products[index].pName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        products[index].pDescription,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        products[index].pPrice,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                    // return Padding(
                    //     padding: const EdgeInsets.all(15),
                    //     child: Container(
                    //         child: Row(children: <Widget>[
                    //       // CircleAvatar(
                    //       //   backgroundImage: Image.network(products[index].pLocation),
                    //       // ),
                    //       // Expanded(
                    //       Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: <Widget>[
                    //             Padding(
                    //               padding: const EdgeInsets.only(left: 10),
                    //               child: Column(
                    //                 mainAxisAlignment: MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                   Text(
                    //                     products[index].pName,
                    //                     style: TextStyle(
                    //                         fontSize: 18,
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //             SizedBox(
                    //               height: 10,
                    //             ),
                    //             Text(
                    //               '\$ ${products[index].pPrice}',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 20),
                    //         child: Text(

                    //           products[index].pQuantity.toString(),
                    //           style: TextStyle(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.bold),

                    //         ),
                    //       )
                    //     ],
                    //  ),
                    // )
                    //             ],
                    //           ),
                    //         ),
                  ]);
              // ])));
            },
          ),
          //   } else {
          //     return Container(
          //       child: Center(
          //         child: Text('Cart is Empty'),
          //       ),
          //     );
          //   }
          // }),
          // Column(
          //           children:[
          //             Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //           _cardView('assets/capture2.png'),
          //           Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Text('Nike Air VaporMax 2020 FK'),
          //                 Text(
          //                   'Travis Scott(Regular Box)    Size 9',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text('110.00'),
          //               ]),
          //             ]),

          //         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //           _cardView('assets/capture4.png'),
          //           Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Text('Nike Air VaporMax 2020 FK'),
          //                 Text(
          //                   'Travis Scott(Regular Box)    Size 9',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text('110.00'),
          //               ])
          //         ]),
          //         Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //           _cardView('assets/capture5.png'),
          //           Column(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Text('Nike Air VaporMax 2020 FK',
          //                     textAlign: TextAlign.start),
          //                 Text(
          //                   'Travis Scott(Regular Box)    Size 9',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text('110.00', textAlign: TextAlign.start),
          //               ])
          //         ])
          //   // ]),
        ]),
      ),
      bottomNavigationBar: _bottomNavigation(),
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
          icon: Icon(Icons.library_books_outlined, color: Colors.grey),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department_outlined, color: Colors.red),
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
