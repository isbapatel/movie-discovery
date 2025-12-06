import 'package:flutter/material.dart';

class LandingIndicator extends StatelessWidget {
  const LandingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
