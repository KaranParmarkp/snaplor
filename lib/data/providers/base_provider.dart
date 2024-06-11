import 'package:flutter/material.dart';

import '../../app/utils/utils.dart';

class BaseProvider with ChangeNotifier {
  Map<String, dynamic> data = <String, dynamic>{};
  Map<String, Status> status = {"main": Status.idle};
  Map<String, String> error = {};
  //BuildContext context = MyApp.appContext;
  setStatus({required String taskName, required Status status}) {
    this.status[taskName] = status;
    notifyListeners();
  }
  getData({required String taskName}){
    return data[taskName];
  }

  getStatus({required String taskName}){
    return status[taskName];
  }
  getSuccessStatus({required String taskName}){
    return status[taskName]==Status.done ? true : false;
  }
  setLoading({required String taskName,bool showDialogLoader=false}) {
    if(showDialogLoader)AppHelper.showLoading();
    if(!showDialogLoader)this.status[taskName] = Status.loading;
    notifyListeners();
  }
  setData({required String taskName, dynamic data,bool hideLoader=true,Function(dynamic data)? onSuccess,bool isPaginated = false}) {
    if(!isPaginated) {
      this.data[taskName] = data;
    }
    if(isPaginated) {
      if(this.data[taskName] is List) {
        this.data[taskName].addAll(data);
      } else {
        this.data[taskName] = data;
      }
    }
    status[taskName] = Status.done;
    if(hideLoader)AppHelper.hideLoading();
    if(onSuccess!=null)onSuccess.call(data);
    notifyListeners();
  }
  setError({required String taskName, String? errorMessage,bool showToast=false,Object? e,StackTrace? s}) {
    if(e!=null)e.printDebug;
    if(s!=null)s.printDebug;
    error[taskName] = errorMessage ?? e.toString();
    status[taskName] = Status.error;
    AppHelper.hideLoading();
    if(showToast)AppHelper.showToast(message: errorMessage ?? e.toString());
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

enum Status { idle, loading, done, error }
