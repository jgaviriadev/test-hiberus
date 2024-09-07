import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/themes/themes.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/entities/card_entity.dart';

class CardPage extends StatelessWidget {
  static const String routeName = 'card';

  final CardEntity card;
  const CardPage({super.key, required this.card});
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: Text(l10n.details, style: textWhiteStyleBold16,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLarge),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "${l10n.name}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      card.name ?? "",
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "${l10n.manaCost}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      AppUtils.removeBraces(card.manaCost ?? ""),
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "${l10n.type}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      card.type ?? "",
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "${l10n.rarity}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      card.rarity ?? "",
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "${l10n.powerAndToughness}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      "${card.power ?? ""} / ${card.toughness ?? ""}" ,
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "CMC",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      "${card.cmc ?? ""}",
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Row(
                children: [
                  Text(
                    "${l10n.artista}:",
                    style: textBlackStyleBold14,
                  ),
                  Expanded(
                    child: Text(
                      card.artist ?? "",
                      style: textBlackStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              Text(
                card.text ?? "",
                style: textBlackStyle14,
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.paddingSmall),
                child: Text(
                  card.flavor ?? "",
                  style: textBlackStyle14,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              if(!AppUtils.isNullOrEmpty(card.imageUrl)) Center(
                child: CachedNetworkImage(
                  height: 300,
                  imageUrl: card.imageUrl!,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
