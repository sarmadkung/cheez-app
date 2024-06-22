import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Image.asset(
        'assets/cheez.png', // Update with your logo path
        height: 70,
      ),
    );
  }
}
