import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/services/api.dart';
import 'dart:convert';
import 'package:mobile/components/appbar.dart';
import 'package:mobile/components/product_card.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var products = new List<Product>();
  var showProdct = new Product();
  String selectedFilter;

  _getProducts() {
    API.getProducts().then((response) {
      setState(() {
        Map<String, dynamic> map = json.decode(response.body);
        Iterable lista = map["docs"];

        products = lista.map((model) => Product.fromJson(model)).toList();
      });
    });
  }

  // _showProduct(id) {
  //   API.showProduct(id).then((response) {
  //     setState(() {
  //       Map<String, dynamic> product = json.decode(response.body);
  //       showProdct = Product.fromJson(product);
  //       Navigator.push(
  //           context,
  //           new MaterialPageRoute(
  //               builder: (context) => DetailPage(showProdct)));
  //     });
  //   });
  // }

  List<String> filters = [
    'Trending',
    'Popular',
    'Lowest Price',
    'Highest Price'
  ];

  @override
  void initState() {
    super.initState();
    _getProducts();
    selectedFilter = "Trending";
  }

  @override
  Widget build(BuildContext context) {
    final itemCountRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: Text(
            "${products.length} Itens",
            style: TextStyle(fontSize: 17.0),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[itemCountRow, listaProdutos()],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  listaProdutos() {
    return Expanded(
      child: GridView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(products[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          childAspectRatio: 0.65,
        ),
        itemCount: products.length,
      ),
    );
  }
}
