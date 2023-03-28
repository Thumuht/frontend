import 'package:flutter/widgets.dart';

class Session extends ChangeNotifier {
  bool login_ = false;
  String? token_;
  int? userId_;

  void login(String token) {
    token_ = token;
    login_ = true;
    notifyListeners();
  }

  void logout() {
    token_ = null;
    login_ = false;
    notifyListeners();
  }
}
