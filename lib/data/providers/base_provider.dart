import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class BaseProvider with ChangeNotifier {
  Map<String, dynamic> data = <String, dynamic>{};
  Map<String, Status> status = {"main": Status.Idle};
  Map<String, String> error = {};
  //BuildContext context = MyApp.appContext;
  setStatus({required String taskName, required Status status}) {
    this.status[taskName] = status;
    notifyListeners();
  }
  getStatus({required String taskName}){
    return status[taskName];
  }
  getSuccessStatus({required String taskName}){
    return status[taskName]==Status.Success ? true : false;
  }
  setLoading({required String taskName,bool showDialogLoader=false}) {
    if(showDialogLoader)AppHelper.showLoading();
    if(!showDialogLoader)this.status[taskName] = Status.Loading;
    notifyListeners();
  }
  setData({required String taskName, dynamic data,bool hideLoader=true}) {
    this.data[taskName] = data;
    status[taskName] = Status.Success;
    if(hideLoader)AppHelper.hideLoading();
    notifyListeners();
  }
  setError({required String taskName, required String errorMessage,bool showToast=false}) {
    error[taskName] = errorMessage;
    status[taskName] = Status.Error;
    AppHelper.hideLoading();
    if(showToast)AppHelper.showToast(message: errorMessage);
    notifyListeners();
  }
  reset(String taskName) {
    data.remove(taskName);
    error.remove(taskName);
    status.remove(taskName);
  }

  notify() {
    notifyListeners();
  }
}

enum Status { Idle, Loading, Success, Error }
