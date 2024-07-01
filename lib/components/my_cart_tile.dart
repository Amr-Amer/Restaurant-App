import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_quantity_selector.dart';
import 'package:new_restaurant_app/models/cart_item.dart';
import 'package:new_restaurant_app/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cartItem.food.imagePath,
                      height: 100,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        cartItem.food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("\$" + cartItem.food.price.toString())
                    ],
                  ),
                  Spacer(),
                  MyQuantitySelector(
                      quantity: cartItem.quantity,
                      food: cartItem.food,
                      onIncrement: () {
                        restaurant.addToCart(
                            cartItem.food, cartItem.selectAddons);
                      },
                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      }),
                ],
              ),

              // addons
              SizedBox(
                height: cartItem.selectAddons.isEmpty ? 0 : 60,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartItem.selectAddons
                        .map(
                          (addon) => Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: FilterChip(
                              padding: EdgeInsets.all(10),
                              label: Row(
                                children: [
                                  Text(addon.name),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text("\$" + addon.price.toString())
                                ],
                              ),
                              onSelected: (value) {},
                              backgroundColor:
                                  Theme.of(context).colorScheme.background,
                              labelStyle: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        );
      },
    );
  }
}
