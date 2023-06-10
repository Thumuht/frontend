import 'package:flutter/widgets.dart';

class Session extends ChangeNotifier {
  bool login_ = false;
  String? token_;
  int? userId_;

  void login(dynamic logret) {
    token_ = logret['token'];
    login_ = true;
    userId_ = logret['userId'];
    notifyListeners();
  }

  void logout() {
    token_ = null;
    userId_ = null;
    login_ = false;
    notifyListeners();
  }
}
