import 'package:flutter/material.dart';

import '../themes/strings.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    var mySecondTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);

    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      padding: const EdgeInsets.all(25.0),
      margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "\$0.99",
                style: myPrimaryTextStyle,
              ),
              Text(
                Strings.instance.deliveryFee,
                style: mySecondTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                Strings.instance.mints,
                style: myPrimaryTextStyle,
              ),
              Text(
                Strings.instance.deliveryTime,
                style: mySecondTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
