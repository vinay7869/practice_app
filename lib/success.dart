import 'package:flutter/material.dart';

class Success extends StatelessWidget {
 final int index;
  const Success({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Congratulations')),
    );
  }
}
