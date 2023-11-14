part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{

}

class CartRemoveFromCartEvent extends CartEvent{
  Object? get productDataModel => null;

}
