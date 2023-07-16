
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier{
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

}