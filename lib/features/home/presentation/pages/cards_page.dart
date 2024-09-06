import 'package:flutter/material.dart';

import '../../../../core/themes/themes.dart';
import '../widgets/widgets.dart';


class CardsPage extends StatelessWidget {
  static const String routeName = 'cards';
  const CardsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardsPage'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          children: [
            MTGCard(),
            SizedBox(height: AppSizes.paddingSmall),
            MTGCard(),
            SizedBox(height: AppSizes.paddingSmall),
            MTGCard(),
            SizedBox(height: AppSizes.paddingSmall),
            MTGCard(),
            SizedBox(height: AppSizes.paddingSmall),
            MTGCard(),
          ],
        ),
      ),
    );
  }
}
