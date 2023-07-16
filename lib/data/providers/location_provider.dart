
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  String? addressLat;
  String? addressLong;
  LocationProvider();

  updateAddress(String lat,String long){
    print("updated lat long");
    addressLat = lat;
    addressLong = long;
    print(addressLong);
    notifyListeners();

  }
}
