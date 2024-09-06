import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/resources.dart';
import '../../../../core/themes/themes.dart';
import '../widgets/widgets.dart';
import 'cards_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.paddingLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    avatarPNG,
                    width: size.width * 0.36,
                  ),
                  const SizedBox(width: AppSizes.paddingSmall),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jhonatan Gaviria M.",
                          style: textBlackStyleBold
                        ),
                        const SizedBox(height: AppSizes.paddingSmall),
                        Text(
                          "+57 314 219 6320",
                          style: textBlackStyle14
                        ),
                        const SizedBox(height: AppSizes.paddingSmall),
                        Text(
                          "gmjhonatan19@gmail.com",
                          style: textBlackStyle14
                        ),
                        const SizedBox(height: AppSizes.paddingSmall),
                        Text(
                          "05-09-2024",
                          style: textBlackStyle14
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.paddingLarge),
              Text(
                l10n.msgHome,
                style: textBlackStyle14,
              ),
              const SizedBox(height: AppSizes.paddingSmall),
              GeneralButton(
                text: l10n.see,
                onPressed: () => context.pushNamed(CardsPage.routeName),
              )
            ],
          ),
        )
      ),
    );
  }
}
