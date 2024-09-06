import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'themes.dart';


class LightTheme {
  LightTheme._();

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.backgroundScaffold,
      textTheme: GoogleFonts.interTextTheme(
        Theme.of(context).textTheme
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(AppColor.blue),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp
            )
          )
        ),
      )
    );
  }
}