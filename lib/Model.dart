import 'package:flutter/cupertino.dart';

class Providermodal extends ChangeNotifier {
  int dirctlang = 0;
  Locale _appLocale = Locale('ar');
  Locale get appLocal => _appLocale;
  void changeDirectionspisfic(int dirc) {
    if (dirc == 1) {
      _appLocale = Locale("en");
      print('encc');
      dirctlang = 0;
    }
    if (dirc == 0) {
      _appLocale = Locale("ar");
      print('arcc');
      dirctlang = 1;
    }
    notifyListeners();
  }
}
