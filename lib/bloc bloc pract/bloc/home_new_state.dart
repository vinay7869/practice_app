part of 'home_new_bloc.dart';

final class HomeNewState {
  final List<Product> products;
  final PageState pageState;

  const HomeNewState({
    required this.products,
    required this.pageState,
  });

  HomeNewState copyWith({
    List<Product>? products,
    PageState? pageState,
  }) {
    return HomeNewState(
      products: products ?? this.products,
      pageState: pageState ?? this.pageState,
    );
  }
}
