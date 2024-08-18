import 'package:flutter/material.dart';

import '../controller/counter_controller.dart';
import '../model/counter.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final Counter _counter = Counter();
  late final CounterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CounterController(_counter);
  }

  void _handleAddToList() {
    setState(() {
      _controller.addToList();
    });
    if (_controller.isMultipleOfFive()) {
      final total = _controller.getTotal();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('合計値 ($total) は 5 の倍数です！')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('カウント'),
            Text(_counter.value.toString()),
            const SizedBox(height: 16),
            const Text('リスト'),
            Text(_counter.values.toString()),
            const SizedBox(height: 16),
            const Text('合計値'),
            Text(_counter.calculateSum().toString()),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => setState(() => _controller.countUp()),
              child: const Text('カウントアップ'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _handleAddToList,
              child: const Text('リストに追加'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.clear();
                });
              },
              child: const Text('クリア'),
            ),
          ],
        ),
      ),
    );
  }
}
