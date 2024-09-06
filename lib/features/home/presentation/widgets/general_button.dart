
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const GeneralButton({
    super.key, 
    required this.text, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}