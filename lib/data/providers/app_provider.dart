
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  Locale _currentLocale = Locale("en");
  Locale get currentLocale => _currentLocale;

  List<Locale> localeList = [
    const Locale('en'), //english
    //const Locale('hi'), //hindi
  ];

  updateLanguage({required Locale locale}){
    _currentLocale = locale;
    notifyListeners();
  }
}