import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/themes.dart';
import '../../domain/entities/card_entity.dart';
import '../widgets/widgets.dart';


class CardsPage extends StatelessWidget {
  static const String routeName = 'cards';

  final List<CardEntity> cards;
  const CardsPage({super.key, required this.cards});
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: Text(l10n.cards, style: textWhiteStyleBold16,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.paddingSmall),
              child: MTGCard(
                card: cards[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
