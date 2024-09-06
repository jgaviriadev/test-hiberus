import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_hiberus_jg/core/themes/colors.dart';

import '../../../../core/routes/resources.dart';
import '../../../home/presentation/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = 'splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    processScreen();
    super.initState();
  }

  Future<void> processScreen() async {
    await Future.delayed(const Duration(seconds: 4),() {
      GoRouter.of(context).go("/${HomePage.routeName}");
    },);
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundScaffold,
      body: Center(
        child: Image.asset(
          hiberusLogoPNG,
          width: size.width * 0.5,
        ),
      ),
    );
  }
}
