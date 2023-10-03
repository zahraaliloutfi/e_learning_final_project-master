import 'dart:ffi';

import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/localizationprovider.dart';
import '../../global/utill/colors.dart';
import '../../global/utill/dimensions.dart';

class CurrencyDialog extends StatelessWidget {
  final bool isCurrency;

  CurrencyDialog({this.isCurrency = true});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _buttons = [
      {
        'button': const LanguageButton(
          language: 'Arabic',
          languageCode: 'ar',
        )
      },
      {
        'button': const LanguageButton(
          language: 'English',
          languageCode: 'en',
        )
      }
    ];
    int index = 0;
    return Dialog(
      backgroundColor: Theme.of(context).highlightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 3.2,
          horizontal: MediaQuery.of(context).size.width / 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('language'),
          CupertinoPicker.builder(
            itemExtent: 60,
            scrollController: FixedExtentScrollController(initialItem: index),
            onSelectedItemChanged: (i) {
              index = i;
            },
            useMagnifier: true,
            magnification: 1.8,
            childCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return _buttons[index]['button'];
            },
          ),
        ],
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    super.key,
    required this.language,
    required this.languageCode,
  });

  final String languageCode;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Selector<LocalizationProvider, LocalizationProvider>(
      selector: (context, localizationProvider) => localizationProvider,
      builder: (context, localization, child) {
        return TextButton(
          onPressed: () {
            localization.setLocale(Locale(languageCode));
          },
          child: Text(language),
        );
      },
    );
  }
}
