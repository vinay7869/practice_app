import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/bloc%20prat/product_details/product_details.dart';
import '../home/cubit/home_cubit.dart';

class ProductList extends StatefulWidget {
  final String category;
  final int id;
  const ProductList({super.key, required this.category, required this.id});

  static const String routeName = 'category';

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late final c = context.read<HomeCubit>();

  @override
  void initState() {
    c.fetchProducts(widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.toUpperCase()),
        ),
        body: BlocSelector<HomeCubit, HomeState, HomeState>(
          bloc: c,
          selector: (state) => state,
          builder: (context, state) {
            return switch (state.pageState) {
              // success
              PageState.success => GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
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
                ),
              _ => const Center(
                  child: CircularProgressIndicator(),
                )
            };
          },
        ));
  }
}
