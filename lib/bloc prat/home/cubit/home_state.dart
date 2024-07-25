part of 'home_cubit.dart';

final class HomeState {
  final List<Product> products;
  final PageState pageState;

  const HomeState({
    required this.products,
    required this.pageState,
  });

  HomeState copyWith({
    List<Product>? products,
    PageState? pageState,
  }) {
    return HomeState(
      products: products ?? this.products,
      pageState: pageState ?? this.pageState,
    );
  }
}
