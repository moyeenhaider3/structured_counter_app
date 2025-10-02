import 'package:structured_counter_app/src/data/datasources/counter_local_data_source.dart';
import 'package:structured_counter_app/src/domain/entities/counter.dart';
import 'package:structured_counter_app/src/domain/repositories/counter_repository.dart';

/// Implementation of the [CounterRepository] that uses a local data source.
class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl(this.localDataSource);

  @override
  Future<Counter> getCounter() {
    return localDataSource.getCounter();
  }

  @override
  Future<void> incrementCounter() {
    return localDataSource.incrementCounter();
  }
}
