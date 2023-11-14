import 'package:flutter/material.dart';
import 'package:to_do/Homee/bloc/home_bloc.dart';
import 'package:to_do/Homee/models/home_product_data_model.dart';
import 'package:to_do/Homee/ui/homee.dart';
import 'package:to_do/feature/cart/bloc/cart_bloc.dart';
import 'package:to_do/feature/wishlist/bloc/wishlist_bloc.dart';

class WishlistTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)

        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children:[
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                        NetworkImage(productDataModel.imageUrl))
                ),
              ),
              const SizedBox(height: 20),
              Text(productDataModel.name,
                  style: TextStyle(fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Text(productDataModel.description),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$" + productDataModel.price.toString(),
                      style: TextStyle(fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                            //     clickedProduct: productDataModel
                            // ));
                          } ,
                          icon: Icon(Icons.favorite_outlined)),
                      IconButton(
                          onPressed: (){
                            // homeBloc.add(HomeProductCartButtonClickedEvent(
                            //     clickedProduct: productDataModel
                            // ));

                          },
                          icon: Icon(Icons.shopping_bag_outlined)),
                    ],
                  )


                ],
              ),


            ]
        )
    );
  }
}
