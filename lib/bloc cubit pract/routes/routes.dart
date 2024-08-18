import 'package:flutter/material.dart';
import '../screens/favorites/screen/fav.dart';
import '../model/product_model.dart';
import '../screens/home/screen/home.dart';
import '../screens/product_details/product_details.dart';
import '../screens/products_list/product_list.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    //
    case Home.routeName:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    //
    case ProductList.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      final category = arguments['category'];
      final id = arguments['id'];

      return MaterialPageRoute(
        builder: (context) => ProductList(
          category: category,
          id: id,
        ),
      );

    //
    case ProductDetails.routeName:
      return MaterialPageRoute(
        builder: (context) => ProductDetails(
          product: settings.arguments as Product,
        ),
      );

    //
    case FavoriteScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const FavoriteScreen(),
      );

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              ));
  }
}
