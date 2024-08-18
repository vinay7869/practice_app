import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_app/bloc%20cubit%20pract/screens/home/logic/logic.dart';
import '../../bloc cubit pract/model/product_model.dart';
import '../../bloc cubit pract/screens/home/cubit/home_cubit.dart';

part 'home_new_event.dart';
part 'home_new_state.dart';

class HomeNewBloc extends Bloc<HomeNewEvent, HomeNewState> {
  HomeNewBloc()
      : super(const HomeNewState(products: [], pageState: PageState.initial)) {
    on<FetchProducts>(_fetchProduct);
  }

  void _fetchProduct(FetchProducts event, Emitter<HomeNewState> emit) async {
    emit(state.copyWith(pageState: PageState.loading));

    try {
      final list = await LogicController().fetchProducts(event.category);
      emit(state.copyWith(products: list, pageState: PageState.success));
    } catch (e) {
      emit(state.copyWith(pageState: PageState.error));
    }
  }
}
