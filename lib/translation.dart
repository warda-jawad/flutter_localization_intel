import 'dart:async';

import 'package:flutter/material.dart';

import 'translation_strings.dart';

class TranslationsDelegate extends LocalizationsDelegate<Translationss> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<Translationss> load(Locale locale) => Translationss.load(locale);

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
