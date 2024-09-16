import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_button.dart';
import 'package:new_restaurant_app/models/food.dart';
import 'package:new_restaurant_app/models/restaurant.dart';
import 'package:new_restaurant_app/themes/strings.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    // todo: initialized selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  //todo method to add to cart
  addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Center(
          child: Text(
            Strings.instance.productAddToCart,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 22),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            },
            child: Text(Strings.instance.goToCart),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(Strings.instance.completeThePurchase),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset(
                widget.food.imagePath,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: Opacity(
                  opacity: 0.8,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: Colors.white,
                        ),
                      )),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "\$" + widget.food.price.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Divider(
                      color: Theme.of(context).colorScheme.secondary,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    Strings.instance.addons,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Theme.of(context).colorScheme.secondary)),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.food.availableAddons.length,
                      itemBuilder: (context, index) {
                        // todo: get individual addon
                        Addon addon = widget.food.availableAddons[index];

                        return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text("\$" + addon.price.toString()),
                            activeColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value) {
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
            MyButton(
                onTap: () => addToCart(widget.food, widget.selectedAddons),
                text: Strings.instance.addToCart),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
