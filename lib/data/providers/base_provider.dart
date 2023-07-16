import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  Map<String, dynamic> data = <String, dynamic>{};
  Map<String, Status> status = {"main": Status.Idle};
  Map<String, String> error = {};

  setStatus(String taskName, Status _status) {
    this.status[taskName] = _status;
    notifyListeners();
  }

  setData(String taskName, dynamic _data) {
    this.data[taskName] = _data;
    this.status[taskName] = Status.Done;
    notifyListeners();
  }

  setError(String taskName, String _error) {
      this.error[taskName] = _error;
      this.status[taskName] = Status.Error;
      notifyListeners();
  }

  reset(String taskName) {
    this.data.remove(taskName);
    this.error.remove(taskName);
    this.status.remove(taskName);
  }

  notify() {
    notifyListeners();
  }
}

enum Status { Idle, Loading, Done, Error }
