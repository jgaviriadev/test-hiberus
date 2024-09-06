import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  static const String routeName = 'card';
  const CardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardPage'),
      ),
      body: const Center(
        child: Text('CardPage'),
      ),
    );
  }
}
