import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/utils/colors.dart';

import 'package:mobile/src/detail_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  _showProduct(context){
    Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => DetailPage(this.product)));
  }

  @override
  Widget build(BuildContext context) {
    final spacer = SizedBox(height: 5.0);

    final image = Hero(tag: product.id, child: Image.network(product.imgUrlColorOne));

    final name = Text(
      product.name.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
      ),
    );

    final brand = Text(
      product.description.toUpperCase(),
      style: TextStyle(fontSize: 11.0, color: Colors.grey),
    );

    final price = Text(
      "\$${product.price.toString()}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.0),
      child: MaterialButton(
        color: AppColors.primaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        onPressed: () => {
          _showProduct(context)
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              image,
              spacer,
              name,
              spacer,
              spacer,
              brand,
              spacer,
              price
            ],
          ),
        ),
      ),
    );
  }
}