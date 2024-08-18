part of 'home_new_bloc.dart';

abstract class HomeNewEvent {}

class FetchProducts extends HomeNewEvent {
  final String category;

  FetchProducts(this.category);
}
