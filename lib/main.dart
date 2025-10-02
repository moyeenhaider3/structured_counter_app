import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:structured_counter_app/src/data/datasources/counter_local_data_source.dart';
import 'package:structured_counter_app/src/data/repositories/counter_repository_impl.dart';
import 'package:structured_counter_app/src/domain/repositories/counter_repository.dart';
import 'package:structured_counter_app/src/presentation/providers/counter_provider.dart';
import 'package:structured_counter_app/src/presentation/screens/counter_screen.dart';

void main() {
  // --- Dependency Injection ---
  // This is a simple manual dependency injection setup. For larger apps,
  // you might consider using a service locator or dependency injection framework
  // like get_it or injectable.

  // 1. Data Layer
  // The data source is the lowest level, responsible for fetching/storing data.
  final CounterLocalDataSource localDataSource = CounterLocalDataSourceImpl();

  // The repository implements the domain's abstract repository and uses the
  // data source to perform operations.
  final CounterRepository repository = CounterRepositoryImpl(localDataSource);

  // 2. Presentation Layer
  // The app is wrapped in a ChangeNotifierProvider to provide the CounterProvider
  // to the widget tree.
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(
        repository: repository,
      ),
      child: const MyApp(),
    ),
  );
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Structured Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const CounterScreen(),
    );
  }
}
