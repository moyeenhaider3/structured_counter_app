import 'package:structured_counter_app/src/domain/entities/counter.dart';

/// Abstract class for the local data source of the counter.
abstract class CounterLocalDataSource {
  /// Gets the current counter value from the local data source.
  Future<Counter> getCounter();

  /// Increments the counter value in the local data source.
  Future<void> incrementCounter();
}

/// Implementation of the local data source that stores the counter in memory.
class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  int _counter = 0;

  @override
  Future<Counter> getCounter() async {
    return Counter(_counter);
  }

  @override
  Future<void> incrementCounter() async {
    _counter++;
  }
}
