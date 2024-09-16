import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectLanguageBottomSheet extends StatefulWidget {
  const SelectLanguageBottomSheet({super.key});

  @override
  State<SelectLanguageBottomSheet> createState() =>
      _SelectLanguageBottomSheetState();
}

class _SelectLanguageBottomSheetState extends State<SelectLanguageBottomSheet> {
  late Locale _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = context.locale;
  }

  void setLanguage(Locale locale) async {
    setState(() {
      _currentValue = locale;
    });
    await context.setLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile(
                value: const Locale('en', 'US'),
                groupValue: _currentValue,
                onChanged: (locale) => setLanguage(locale!),
                title: const Text('English'),
                subtitle: const Text('الانجليزية'),
              ),
              RadioListTile(
                value: const Locale('ar', 'EG'),
                groupValue: _currentValue,
                onChanged: (locale) => setLanguage(locale!),
                title: const Text('Arabic'),
                subtitle: const Text('العربية'),
              ),
            ],
          ),
        );
      },
    );
  }
}
