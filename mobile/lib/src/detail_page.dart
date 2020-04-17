import 'package:flutter/material.dart';
import 'package:mobile/models/product.dart';
import 'package:mobile/components/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/utils/colors.dart';

class DetailPage  extends StatelessWidget {
  final Product product;

  DetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    ScreenUtil.init(context, width: 388, height: 1600, allowFontScaling: true);

    final multiplier = screenHeight / screenWidth;

    final spacer = SizedBox(height: 10.0);

    final image = Hero(
      tag: product.id,
      child: Image.network(
        product.imgUrlColorOne,
        height: ScreenUtil().setHeight(400) * multiplier,
      ),
    );

    final name = Text(
      product.name.toUpperCase(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
    );

    final brand = Text(
      product.description.toUpperCase(),
      style: TextStyle(fontSize: 14.0, color: Colors.grey),
    );

    final top = Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            name,
            spacer,
            brand,
            image,
            // colorChooser
          ],
        ),
      ),
    );

    final bottom = Container(
      height: MediaQuery.of(context).size.height * 0.12, // 95.0
      color: Colors.white,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        )),
        onPressed: () { },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Add no carrinho - ",
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            Text(
              "\$${product.price.toString()}",
              style: TextStyle(fontSize: 22.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: CustomAppBar(isHome: false),
        body : Column(
        children: <Widget>[top,bottom],
      ),
    );
  }
}