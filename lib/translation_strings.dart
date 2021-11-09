import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../l10n/messages_all.dart';

class Translationss {
  static Future<Translationss> load(Locale locale) {
    final String name =
        (locale.countryCode != null && locale.countryCode!.isEmpty)
            ? locale.languageCode
            : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((dynamic _) {
      Intl.defaultLocale = localeName;
      return new Translationss();
    });
  }

  static Translationss? of(BuildContext context) {
    return Localizations.of<Translationss>(context, Translationss);
  }

  String get loading {
    return Intl.message(
      'Loading....',
      name: 'loading',
    );
  }

  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
    );
  }
}
