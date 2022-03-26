import 'package:flutter/material.dart';

class ProgressIndicatorScreen extends StatelessWidget {
  const ProgressIndicatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
