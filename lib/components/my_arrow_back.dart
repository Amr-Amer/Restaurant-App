import 'package:flutter/material.dart';

class MyArrowBack extends StatelessWidget {
  void Function() onPressed;

  MyArrowBack({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_circle_left_sharp,
            size: 33,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
    );
  }
}
