import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int _value = 0;
  final List<int> _values = [];

  int get value => _value;

  List<int> get values => List.unmodifiable(_values);

  int _sum = 0;

  void increment() {
    _value++;
    notifyListeners();
  }

  void appendValue() {
    _values.add(_value);
    _sum += _value;
    notifyListeners();
  }

  void clearValues() {
    _value = 0;
    _sum = 0;
    _values.clear();
    notifyListeners();
  }

  int calculateSum() => _sum;
}
