import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/components/my_cart_tile.dart';
import 'package:new_restaurant_app/models/restaurant.dart';
import 'package:new_restaurant_app/pages/home_page.dart';
import 'package:new_restaurant_app/pages/payment_page.dart';
import 'package:new_restaurant_app/themes/strings.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            actions: [
              IconButton(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                          Strings.instance.areYouSureYouWantToClearTheCart),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(Strings.instance.cancel)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: Text(Strings.instance.ok)),
                      ],
                    ),
                  );
                },
                icon:
                    const Icon(Icons.delete_sweep, size: 33, color: Colors.red),
              ),
            ],
            leading: BackButton(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            toolbarHeight: 110,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              Strings.instance.cart,
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          body: Column(
            children: [
              // list of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                            child: Center(
                                child: Text(
                            Strings.instance.cartIsEmpty,
                            style: const TextStyle(fontSize: 18),
                          )))
                        : Expanded(
                            child: ListView.builder(
                                itemCount: userCart.length,
                                itemBuilder: (context, index) {
                                  // get individual cart item
                                  final cartItem = userCart[index];

                                  // return cart tile Ui
                                  return MyCartTile(cartItem: cartItem);
                                }))
                  ],
                ),
              ),

              // button to pay
              MyButton(
                  onTap: () {
                    return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          Strings.instance.chooseThePaymentMethod,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const PaymentPage(),
                                  ));
                            },
                            child: Text(Strings.instance.visa),
                          ),
                          TextButton(
                            onPressed: () {
                              restaurant.clearCart();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ));
                            },
                            child: Text(Strings.instance.cache),
                          ),
                        ],
                      ),
                    );
                  },
                  text: Strings.instance.goToCheckOut),

              const SizedBox(
                height: 25,
              )
            ],
          ),
        );
      },
    );
  }
}
