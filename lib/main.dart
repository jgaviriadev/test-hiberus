import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/routes/app_routes.dart';
import 'core/themes/themes.dart';

void main() {
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
        );
      }
    );
  }
}
