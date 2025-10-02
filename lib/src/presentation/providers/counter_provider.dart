import 'package:flutter/material.dart';
import 'package:structured_counter_app/src/domain/repositories/counter_repository.dart';

/// Provider for the counter screen that manages the state of the counter.
class CounterProvider extends ChangeNotifier {
  final CounterRepository repository;

  int _counter = 0;

  int get counter => _counter;

  CounterProvider({required this.repository}) {
    _loadCounter();
  }

  /// Loads the initial counter value.
  void _loadCounter() async {
    final counter = await repository.getCounter();
    _counter = counter.value;
    notifyListeners();
  }

  /// Increments the counter and notifies listeners.
  void increment() async {
    await repository.incrementCounter();
    final counter = await repository.getCounter();
    _counter = counter.value;
    notifyListeners();
  }
}
