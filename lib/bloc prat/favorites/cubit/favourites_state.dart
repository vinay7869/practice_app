part of 'favourites_cubit.dart';

class FavouritesState {
  final List<Product> favProducts;
  final bool isFav;

  FavouritesState({
    required this.favProducts,
    required this.isFav,
  });

  FavouritesState copyWith({
    List<Product>? favProducts,
    final bool? isFav,
  }) {
    return FavouritesState(
      favProducts: favProducts ?? this.favProducts,
      isFav: isFav ?? this.isFav,
    );
  }
}
