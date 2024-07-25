import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/bloc%20prat/favorites/screen/fav.dart';
import 'package:practice_app/bloc%20prat/home/cubit/home_cubit.dart';
import 'package:practice_app/bloc%20prat/products_list/product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final c = context.read<HomeCubit>();
  final catList = {
    "men's clothing":
        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg',
    "jewelery":
        'https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg',
    "electronics": 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg',
    "women's clothing":
        'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Cubit'),
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, FavoriteScreen.routeName),
              icon: const Icon(
                Icons.favorite_rounded,
                size: 30,
              ))
        ],
      ),
      body: Center(
        child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 70,
            runSpacing: 20,
            children: [
              ...List.generate(catList.length, (index) {
                final text = catList.keys.elementAt(index);
                final image = catList.values.elementAt(index);
                return SizedBox(
                  height: MediaQuery.sizeOf(context).height * .34,
                  width: MediaQuery.sizeOf(context).width * .3,
                  child: InkWell(
                    onTap: () => Navigator.pushNamed(
                        context, ProductList.routeName,
                        arguments: {'category': text, 'id': 27}),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CachedNetworkImage(
                          imageUrl: image,
                          placeholder: (context, url) =>
                              Image.asset('assets/ph.png'),
                          errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(),
                        ),
                        const SizedBox(height: 10),
                        Text(text.toUpperCase())
                      ],
                    ),
                  ),
                );
              })
            ]),
      ),
    );
  }
}
