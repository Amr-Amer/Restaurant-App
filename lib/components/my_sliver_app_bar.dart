import 'package:flutter/material.dart';
import 'package:new_restaurant_app/pages/cart_page.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import '../themes/strings.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    int cartItemCount = context.watch<Restaurant>().cart.length;

    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      expandedHeight: 300,
      collapsedHeight: 130,
      toolbarHeight: 90,
      floating: false,
      pinned: true,
      actions: [
        // cart icon

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Go to cart page
                  Navigator.push(
                    context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 23,
                      minHeight: 20,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
      title: Text(Strings.instance.sunsetDiner),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
