import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hiberus_jg/core/utils/utils.dart';

import '../../../../core/themes/themes.dart';
import '../../domain/entities/card_entity.dart';
import '../pages/card_page.dart';

class MTGCard extends StatelessWidget {
  final CardEntity card;
  const MTGCard({
    super.key,
    required this.card,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingLarge),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${l10n.manaCost}:",
                            style: textBlackStyleBold14,
                          ),
                          Expanded(
                            child: Text(
                              AppUtils.removeBraces(card.manaCost ?? ""),
                              textAlign: TextAlign.right,
                              style: textBlackStyle14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${l10n.name}:", style: textBlackStyleBold14),
                          Expanded(
                            child: Text(
                              card.name ?? "",
                              textAlign: TextAlign.right,
                              style: textBlackStyle14,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${l10n.type}:", style: textBlackStyleBold14),
                          Expanded(
                            child: Text(
                              card.type ?? "",
                              textAlign: TextAlign.right,
                              style: textBlackStyle14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSizes.paddingSmall),
                GestureDetector(
                  onTap: () async {
                    context.pushNamed(CardPage.routeName, extra: card);
                  },
                  child: const Icon(Icons.navigate_next_rounded),
                ),
              ],
            ),
            const Divider(),
            Center(
              child: Text(
                card.rarity ?? "",
                style: textBlackStyleBold14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
