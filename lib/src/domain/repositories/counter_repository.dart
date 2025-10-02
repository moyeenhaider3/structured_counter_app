import 'package:structured_counter_app/src/domain/entities/counter.dart';

/// Abstract repository for counter operations.
abstract class CounterRepository {
  /// Gets the current counter value.
  Future<Counter> getCounter();

  /// Increments the counter value.
  Future<void> incrementCounter();
}
