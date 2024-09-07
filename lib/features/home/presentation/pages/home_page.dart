import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:test_hiberus_jg/core/utils/utils.dart';

import '../../../../core/routes/resources.dart';
import '../../../../core/themes/themes.dart';
import '../../../../core/utils/notifications.dart';
import '../../../../injection_container.dart';
import '../bloc/home_bloc.dart';
import '../widgets/drop_button_language.dart';
import '../widgets/widgets.dart';
import 'cards_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = getIt<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;
    return BlocProvider.value(
      value: homeBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if(state is SuccessGetMTGCardsState){
            context.pushNamed(CardsPage.routeName, extra: state.cards,);
          }
          if(state is FailedGetMTGCardsState){
            Notifications.showSnackBarError(
              title: l10n.hello,
              message: AppUtils.getMessageError(state.message, l10n),
            );
          }
        },
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColor.backgroundScaffold,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.paddingLarge),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topRight,
                        child: DropButtonLanguage(
                          items: ["en", "es"],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  avatarPNG,
                                  width: 36.w,
                                ),
                                const SizedBox(width: AppSizes.paddingSmall),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Jhonatan Gaviria M.", style: textBlackStyleBold),
                                      const SizedBox(height: AppSizes.paddingSmall),
                                      Text("+57 314 219 6320", style: textBlackStyle14),
                                      const SizedBox(height: AppSizes.paddingSmall),
                                      Text("gmjhonatan19@gmail.com", style: textBlackStyle14),
                                      const SizedBox(height: AppSizes.paddingSmall),
                                      Text("07-09-2024", style: textBlackStyle14),
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
                              onPressed: () => homeBloc.add(const GetMTGCardsEvent()),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is LoadingState,
              builder: (context, state) {
                bool isLoading = state is LoadingState ? state.isLoading : false;
                return Visibility(
                  visible: isLoading,
                  child: const SimpleLoading(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
