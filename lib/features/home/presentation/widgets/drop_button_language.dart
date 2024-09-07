import 'package:flutter/material.dart';


import '../../../../core/themes/themes.dart';
import '../../../../core/utils/language.dart';
import '../../../../main.dart';


class DropButtonLanguage extends StatefulWidget {
  const DropButtonLanguage({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<DropButtonLanguage> createState() => _DropButtonLanguageState();
}

class _DropButtonLanguageState extends State<DropButtonLanguage> {
  String currentValue = "en";

  @override
  void didChangeDependencies() async {
    Locale locale = await getLocale();
    setState(() {
      currentValue = locale.languageCode;
    });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColor.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingLarge),
        child: DropdownButton(
          underline: const SizedBox(),
          onChanged: (value) async {
            if(value != null){
              Locale locale = await setLocale(value);
              Future.delayed(const Duration(seconds: 0), () {
                MyApp.setLocale(context, locale);
              });
              setState(() {
                currentValue = value;
              });
            }
          },
          value: currentValue,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value.toUpperCase(),
                style: textWhiteStyleBold14,
              ),
            );
          }).toList(),
          dropdownColor: AppColor.blue,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          borderRadius:  BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}