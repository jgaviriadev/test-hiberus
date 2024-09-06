import 'package:flutter/material.dart';

class CardsPage extends StatelessWidget {
  static const String routeName = 'cards';
  const CardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardsPage'),
      ),
      body: const Center(
        child: Text('CardsPage'),
      ),
    );
  }
}
