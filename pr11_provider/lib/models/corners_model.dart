import 'package:flutter/foundation.dart';

class CornersModel extends ChangeNotifier {
  double _topLeft = 0;
  double _topRight = 0;
  double _bottomLeft = 0;
  double _bottomRight = 0;

  double get topLeft => _topLeft;
  double get topRight => _topRight;
  double get bottomLeft => _bottomLeft;
  double get bottomRight => _bottomRight;

  set topLeft(double value) {
    _topLeft = value;
    notifyListeners();
  }

  set topRight(double value) {
    _topRight = value;
    notifyListeners();
  }

  set bottomLeft(double value) {
    _bottomLeft = value;
    notifyListeners();
  }

  set bottomRight(double value) {
    _bottomRight = value;
    notifyListeners();
  }
}