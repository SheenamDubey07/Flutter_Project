import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';
import 'package:to_do/data/cart_items.dart';
import 'package:to_do/data/wishlist_items.dart';

import '../../data/grocery.dart';
import '../models/home_product_data_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);

  }


  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async{
        emit(HomeLoadingState(

        ));
        await Future.delayed(Duration(seconds: 5));
        emit(HomeLoadedSuccessState(products: GroceryData.groceryProducts.map((e) => ProductDataModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl'])).toList()));


  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
        print('Wishlist Product Clicked');
        wishlistItems.add(event.clickedProduct);
        emit(HomeProductItemWishListedActionState());

  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
        print('Cart Product Clicked');
        cartItems.add(event.clickedProduct);
        emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('WishList Navigate is Clicked');
    emit(HomeNavigationToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate is Clicked');
    emit(HomeNavigationToCartPageActionState());
  }

}
