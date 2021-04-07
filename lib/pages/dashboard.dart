import 'package:carousel_pro/carousel_pro.dart';
import 'package:dukan/config.dart';
import 'package:dukan/widgets/widget_home_categories.dart';
import 'package:dukan/widgets/widget_home_products.dart';
import 'package:flutter/material.dart';


class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: ListView(
              children: [
                imageCarousel(context),
                WidgetCategories(),
                WidgetHomeProducts(labelName:'Top Selling Products',tagName: Config.topsellingProductsTagId),
                WidgetHomeProducts(labelName:'Top savers today!',tagName: Config.todayOffersTagId, )
              ],
            )));
  }

  Widget imageCarousel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:3.0),
      child: new Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          child:Carousel(
              overlayShadow: false,
              borderRadius: true,
              boxFit: BoxFit.none,
              autoplay: true,
              dotSize: 4.0,
              images: [
                FittedBox(
                  fit: BoxFit.fill,
                 child:Image.network('https://images.pexels.com/photos/336372/pexels-photo-336372.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network('https://images.pexels.com/photos/5242808/pexels-photo-5242808.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network('https://images.pexels.com/photos/1342609/pexels-photo-1342609.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                ),
                FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network('https://images.pexels.com/photos/4427816/pexels-photo-4427816.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
                ),
              ])
              ),
    );
  }
}

