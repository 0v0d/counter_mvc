import '../model/counter.dart';

class CounterController {
  const CounterController(Counter model) : _model = model;

  final Counter _model;

  int getValue() => _model.value;

  List<int> getValues() => _model.values;

  int getTotal() => _model.calculateSum();

  void countUp() => _model.increment();

  void addToList() => _model.appendValue();

  bool isMultipleOfFive() => _model.calculateSum() % 5 == 0;

  void clear() => _model.clearValues();
}
