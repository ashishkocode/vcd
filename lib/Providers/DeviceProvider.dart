import 'package:flutter/cupertino.dart';

class DeviceProvider extends ChangeNotifier {
  var deviceData;

  get deviceDataDetails {
    return deviceData;
  }

  void getDeviceDataDetails(data) {
    deviceData = data;
    notifyListeners();
  }
}
