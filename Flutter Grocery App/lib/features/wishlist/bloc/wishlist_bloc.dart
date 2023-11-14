import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../Homee/models/home_product_data_model.dart';
import '../../../data/wishlist_items.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);

  }
  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event, Emitter<WishlistState>emit){
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
