import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/components/my_cart_tile.dart';
import 'package:new_restaurant_app/models/restaurant.dart';
import 'package:new_restaurant_app/pages/home_page.dart';
import 'package:new_restaurant_app/pages/payment_page.dart';
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
                padding: const EdgeInsets.only(right: 10),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title:
                          const Text("Are you Sure you want to clear the cart"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: const Text("Ok")),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete_sweep, size: 40, color: Colors.red),
              ),
            ],
            leading: IconButton(
              padding: const EdgeInsets.only(left: 10),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_circle_left_rounded,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            toolbarHeight: 110,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Cart",
              style: TextStyle(
                  fontSize: 30,
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
                        ? const Expanded(
                            child: Center(
                                child: Text(
                            "Cart is empty.. ",
                            style: TextStyle(fontSize: 18),
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
                          "Choose the payment method ?!",
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
                            child: const Text("VISA"),
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
                            child: const Text("CACHE"),
                          ),
                        ],
                      ),
                    );
                  },
                  text: "Go To CheckOut"),

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
