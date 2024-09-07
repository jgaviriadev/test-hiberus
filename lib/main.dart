import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/routes/app_routes.dart';
import 'core/themes/themes.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          routerConfig: AppRouter.routes,
          debugShowCheckedModeBanner: false,
          theme: LightTheme.themeData(context),
          title: 'Test Hiberus',
          localizationsDelegates: const [
            AppLocalizations.delegate, 
            GlobalMaterialLocalizations.delegate, 
            GlobalCupertinoLocalizations.delegate, 
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
        );
      }
    );
  }
}
