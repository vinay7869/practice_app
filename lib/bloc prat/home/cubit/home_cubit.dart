import 'package:bloc/bloc.dart';
import '../logic/logic.dart';
import '../../../model/product_model.dart';

part 'home_state.dart';

enum PageState { initial, loading, success, error }

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(const HomeState(
          products: [],
          pageState: PageState.initial,
        ));

  void updatePageState(PageState pageState) {
    emit(state.copyWith(pageState: pageState));
  }

  Future<void> fetchProducts(String? category) async {
    updatePageState(PageState.loading);

    final data = await LogicController().fetchProducts(category);

    if (data.isEmpty) {
      updatePageState(PageState.error);
    } else {
      emit(state.copyWith(
          pageState: PageState.success, products: List.of(data)));
    }
  }
}
