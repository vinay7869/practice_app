import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../helpers/pref.dart';
import '../../../model/product_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : super(FavouritesState(
          favProducts: Pref.favProducts,
          isFav: false,
        ));

  List<Product> favProducts = List.of(Pref.favProducts);

  void addFav(Product product) {
    favProducts.add(product);
    Pref.favProducts = favProducts;
    emit(state.copyWith(favProducts: List.of(favProducts), isFav: true));
  }

  void removeFav(Product product) {
    favProducts.remove(product);
    Pref.favProducts = favProducts;
    emit(state.copyWith(favProducts: List.of(favProducts), isFav: false));
  }
}
