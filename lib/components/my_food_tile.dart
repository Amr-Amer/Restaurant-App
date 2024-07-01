import 'package:flutter/material.dart';
import 'package:new_restaurant_app/components/my_rating_bar.dart';
import 'package:new_restaurant_app/models/food.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTab;

  const MyFoodTile({super.key, required this.food, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTab,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Row(
              children: [
                // text food Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "\$" + food.price.toString(),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyRatingBar(rating: food.rating),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      food.imagePath,
                      height: 120,
                      width: 130,
                    )),
              ],
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
