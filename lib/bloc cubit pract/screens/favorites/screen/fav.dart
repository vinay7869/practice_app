import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/favourites_cubit.dart';
import '../../product_details/product_details.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static const String routeName = 'FavoriteScreen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late final c = context.read<FavouritesCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: BlocBuilder<FavouritesCubit, FavouritesState>(
        bloc: c,
        builder: (context, state) {
          log('pp -->> ${state.favProducts.length}');
          return GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: state.favProducts.length,
            itemBuilder: (context, index) {
              final product = state.favProducts.toSet().toList()[index];
              return InkWell(
                onTap: () => Navigator.pushNamed(
                    context, ProductDetails.routeName,
                    arguments: product),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * .2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: CachedNetworkImageProvider(
                                    product.image ?? ""))),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.title ?? '',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
