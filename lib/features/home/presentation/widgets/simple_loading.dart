import 'package:flutter/material.dart';

import '../../../../core/themes/themes.dart';

class SimpleLoading extends StatelessWidget {
  final Color? color; 
  final Color? colorProgress;
  const SimpleLoading(
      {super.key, this.color, this.colorProgress});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.black.withOpacity(0.3),
      child: Center(
        child: CircularProgressIndicator(
          color: colorProgress ?? AppColor.primaryColor,
        ),
      ),
    );
  }
}