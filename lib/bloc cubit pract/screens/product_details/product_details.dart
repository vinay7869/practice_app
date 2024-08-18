import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../favorites/cubit/favourites_cubit.dart';
import '../../model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  static const String routeName = 'ProductDetails';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late final c = context.read<FavouritesCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 20),
        physics: const BouncingScrollPhysics(),
        children: [
          CachedNetworkImage(
            imageUrl: widget.product.image!,
            placeholder: (context, url) => Image.asset('assets/ph.png'),
            height: MediaQuery.sizeOf(context).height * .4,
          ),
          const SizedBox(height: 7),
          const Divider(),
          Row(
            children: [
              Expanded(
                  child: Text(
                widget.product.title!,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
              )),
              IconButton(onPressed: () {
                if (c.favProducts.contains(widget.product)) {
                  c.removeFav(widget.product);
                } else {
                  c.addFav(widget.product);
                }
              }, icon: BlocBuilder<FavouritesCubit, FavouritesState>(
                // selector: (state) => state.isFav,
                builder: (context, state) {
                  final isFav = state.favProducts.contains(widget.product);

                  return isFav
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border, color: Colors.red);
                },
              ))
            ],
          ),
          const SizedBox(height: 10),
          Text(widget.product.description!)
        ],
      ),
    );
  }
}
