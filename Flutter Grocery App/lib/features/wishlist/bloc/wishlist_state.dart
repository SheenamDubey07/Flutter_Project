part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}
abstract class WishlistActonState extends WishlistState{}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> wishlistItems;
  WishlistSuccessState({
    required this.wishlistItems,
  });
}
