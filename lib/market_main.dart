import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.image});
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyApp();
}

class _MyApp extends State<MyHomePage> {
  final List<Product> products = [
    Product(
        name: "berg",
        description: "Description berg",
        price: 19.99,
        image: "assets/images/berg.jpg"),
    Product(
        name: "Chicken",
        description: "Description Chicken",
        price: 29.99,
        image: "assets/images/Chicken.jpg"),
    Product(
        name: "Food",
        description: "Description Food",
        price: 39.99,
        image: "assets/images/Food.jpg"),
    Product(
        name: "berg",
        description: "Description berg",
        price: 19.99,
        image: "assets/images/soop.jpg"),
    Product(
        name: "Chicken",
        description: "Description Chicken",
        price: 29.99,
        image: "assets/images/m.jpg"),
    Product(
        name: "Food",
        description: "Description Food",
        price: 40.99,
        image: "assets/images/chi.jpg"),
    Product(
        name: "Spogeti",
        description: "Description Food",
        price: 60.99,
        image: "assets/images/mm.jpg"),
    Product(
        name: "Cake",
        description: "Description Food",
        price: 66.99,
        image: "assets/images/c.jpg"),
    // Add more products as needed
  ];

  int _selectedIndex = 0;
  bool _isSearchOff = true;
  bool _isDark = true;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _toggleSearch() {
    setState(() {
      _isSearchOff = !_isSearchOff;
    });
  }
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context); // Trigger rebuild when window is resized. This updates the bounding box sizes.
   /* final image = Image.asset(exampleImagePath, key: _imageKey);
    // Yes, we call this every time the widget rebuilds, so we update our understanding of the image size.
    WidgetsBinding.instance.addPostFrameCallback(_updateImageSize);*/
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: _isDark ? Brightness.dark : Brightness.light);

    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(61, 61, 61, 1.0),
        appBar: AppBar(
          toolbarHeight: 120,
          shape: const Border(
              bottom: BorderSide(
                  color: Colors.orange,
                  width: 4
              )
          ),
          bottom: _isSearchOff? null : PreferredSize(
              preferredSize: Size.fromHeight(30),
              child:Container(
                color: Colors.transparent, // set your color
                child: Column(
                  children: [
                   /* Text("data"), // set an icon or image
                    IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {})*/
                    SearchAnchor(
                        builder: (BuildContext context, SearchController controller) {
                          return SearchBar(
                            controller: controller,
                            padding: const MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 20.0)),
                            onTap: () {
                              controller.openView();
                            },
                            onChanged: (_) {
                              controller.openView();
                            },
                            leading: const Icon(Icons.search),
                            trailing: <Widget>[
                              Tooltip(
                                message: 'Change brightness mode',
                                child: IconButton(
                                  /*isSelected: _isDark,
                                  onPressed: () {
                                    setState(() {
                                      _isDark = !_isDark;
                                    });
                                  },*/
                                  onPressed: () {  },
                                  icon: const Icon(Icons.add_alert),
                                  //selectedIcon: const Icon(Icons.brightness_2_outlined),
                                ),
                              )
                            ],
                          );
                        }, suggestionsBuilder:
                        (BuildContext context, SearchController controller) {
                      return List<ListTile>.generate(5, (int index) {
                        final String item = 'item $index';
                        return ListTile(
                          title: Text(item),
                          onTap: () {
                            setState(() {
                              controller.closeView(item);
                            });
                          },
                        );
                      });
                    }),// set your search bar setting
                  ],
                ),
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /*ClipRRect(
                *//*borderRadius: BorderRadius.circular(75.0),*//*
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight:Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/sec.jpg',
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
              SizedBox(width: 30.0),
              ClipRRect(
                *//*borderRadius: BorderRadius.circular(75.0),*//*
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight:Radius.circular(15),
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/first.jpg',
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
              SizedBox(width: 30.0),*/
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                    color: Colors.orange,
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    offset: Offset(
                        0.0, 0.0), // shadow direction: bottom right
                  )
                ], borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/mylog.jpg',
                    fit: BoxFit.contain,
                    height: 80,
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/textlogo.jpg',
                    fit: BoxFit.contain,
                    height: 100,
                    width: 300,
                  ),
                ),
              ),
              /*Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Shop Page'))*/
            ],

          ),
          shadowColor: Color.fromRGBO(126, 64, 0, 1.0),
          actions: [
            IconButton(
              onPressed: () {
                _toggleSearch();
              },
              icon: Icon(Icons.search),
            ),
            /*IconButton(
              onPressed: () {},
              icon: Icon(Icons.call),
            ),*/
            IconButton(
              isSelected: _isDark,
              onPressed: () {
                setState(() {
                  _isDark = !_isDark;
                });
              },
              icon: const Icon(Icons.wb_sunny_outlined),
              selectedIcon: const Icon(Icons.brightness_2_outlined),),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
          foregroundColor: Color.fromRGBO(255, 255, 255, 1.0),
          backgroundColor: Color.fromRGBO(14, 0, 0, 1.0),
        ),
        body: GridView.builder(
          gridDelegate: /*SliverGridDelegateWithFixedCrossAxisCount*/
              CustomGridDelegate(dimension: 240.0),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          },
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(121, 0, 0, 1.0),
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Home'),
                selected: _selectedIndex == 0,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(0);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business'),
                selected: _selectedIndex == 1,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(1);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('School'),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app
                  _onItemTapped(2);
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        /*bottomSheet:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 80,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Shop Page'))
          ],

        ),*/
        bottomNavigationBar: Container(
            color: Colors.brown,
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 80,
            ),/*Text('Shop Page')*/
        )
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder( //<-- SEE HERE
        side: BorderSide(
          color: Color.fromRGBO(141, 0, 0, 1.0),
          width:3,
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                ClipRRect(
                  /*borderRadius: BorderRadius.circular(75.0),*/
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    product.image,
                    height: 150.0,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            product.name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Handle product click or add to cart action
                        // You can navigate to the product details page or add the product to the cart
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 30.0),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*SizedBox(height: 8.0),
                    Text(product.description),*/
                    const SizedBox(height: 8.0),
                    Text('\$${product.price.toStringAsFixed(2)}'),
                  ],
                ),
              ]),
        ],
      ),
    );
  }
}

class CustomGridDelegate extends SliverGridDelegate {
  CustomGridDelegate({required this.dimension});

  // This is the desired height of each row (and width of each square).
  // When there is not enough room, we shrink this to the width of the scroll view.
  final double dimension;

  // The layout is two rows of squares, then one very wide cell, repeat.

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // Determine how many squares we can fit per row.
    int count = constraints.crossAxisExtent ~/ dimension;
    if (count < 1) {
      count = 1; // Always fit at least one regardless.
    }
    final double squareDimension = constraints.crossAxisExtent / count;
    return CustomGridLayout(
      crossAxisCount: count,
      fullRowPeriod:
          3, // Number of rows per block (one of which is the full row).
      dimension: squareDimension,
    );
  }

  @override
  bool shouldRelayout(CustomGridDelegate oldDelegate) {
    return dimension != oldDelegate.dimension;
  }
}

class CustomGridLayout extends SliverGridLayout {
  const CustomGridLayout({
    required this.crossAxisCount,
    required this.dimension,
    required this.fullRowPeriod,
  })  : assert(crossAxisCount > 0),
        assert(fullRowPeriod > 1),
        loopLength = crossAxisCount * (fullRowPeriod - 1) + 1,
        loopHeight = fullRowPeriod * dimension;

  final int crossAxisCount;
  final double dimension;
  final int fullRowPeriod;

  // Computed values.
  final int loopLength;
  final double loopHeight;

  @override
  double computeMaxScrollOffset(int childCount) {
    // This returns the scroll offset of the end side of the childCount'th child.
    // In the case of this example, this method is not used, since the grid is
    // infinite. However, if one set an itemCount on the GridView above, this
    // function would be used to determine how far to allow the user to scroll.
    if (childCount == 0 || dimension == 0) {
      return 0;
    }
    return (childCount ~/ loopLength) * loopHeight +
        ((childCount % loopLength) ~/ crossAxisCount) * dimension;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    // This returns the position of the index'th tile.
    //
    // The SliverGridGeometry object returned from this method has four
    // properties. For a grid that scrolls down, as in this example, the four
    // properties are equivalent to x,y,width,height. However, since the
    // GridView is direction agnostic, the names used for SliverGridGeometry are
    // also direction-agnostic.
    //
    // Try changing the scrollDirection and reverse properties on the GridView
    // to see how this algorithm works in any direction (and why, therefore, the
    // names are direction-agnostic).
    final int loop = index ~/ loopLength;
    final int loopIndex = index % loopLength;
    if (loopIndex == loopLength - 1) {
      // Full width case.
      return SliverGridGeometry(
        scrollOffset: (loop + 1) * loopHeight - dimension, // "y"
        crossAxisOffset: 0, // "x"
        mainAxisExtent: dimension, // "height"
        crossAxisExtent: crossAxisCount * dimension, // "width"
      );
    }
    // Square case.
    final int rowIndex = loopIndex ~/ crossAxisCount;
    final int columnIndex = loopIndex % crossAxisCount;
    return SliverGridGeometry(
      scrollOffset: (loop * loopHeight) + (rowIndex * dimension), // "y"
      crossAxisOffset: columnIndex * dimension, // "x"
      mainAxisExtent: dimension, // "height"
      crossAxisExtent: dimension, // "width"
    );
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    // This returns the first index that is visible for a given scrollOffset.
    //
    // The GridView only asks for the geometry of children that are visible
    // between the scroll offset passed to getMinChildIndexForScrollOffset and
    // the scroll offset passed to getMaxChildIndexForScrollOffset.
    //
    // It is the responsibility of the SliverGridLayout to ensure that
    // getGeometryForChildIndex is consistent with getMinChildIndexForScrollOffset
    // and getMaxChildIndexForScrollOffset.
    //
    // Not every child between the minimum child index and the maximum child
    // index need be visible (some may have scroll offsets that are outside the
    // view; this happens commonly when the grid view places tiles out of
    // order). However, doing this means the grid view is less efficient, as it
    // will do work for children that are not visible. It is preferred that the
    // children are returned in the order that they are laid out.
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    return loops * loopLength + extra * crossAxisCount;
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    // (See commentary above.)
    final int rows = scrollOffset ~/ dimension;
    final int loops = rows ~/ fullRowPeriod;
    final int extra = rows % fullRowPeriod;
    final int count = loops * loopLength + extra * crossAxisCount;
    if (extra == fullRowPeriod - 1) {
      return count;
    }
    return count + crossAxisCount - 1;
  }
}
