import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:structured_counter_app/src/data/datasources/counter_local_data_source.dart';
import 'package:structured_counter_app/src/data/repositories/counter_repository_impl.dart';
import 'package:structured_counter_app/src/domain/repositories/counter_repository.dart';
import 'package:structured_counter_app/src/presentation/providers/counter_provider.dart';
import 'package:structured_counter_app/src/presentation/screens/counter_screen.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // --- Dependency Injection ---
    final CounterLocalDataSource localDataSource = CounterLocalDataSourceImpl();
    final CounterRepository repository = CounterRepositoryImpl(localDataSource);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => CounterProvider(
          repository: repository,
        ),
        child: const MaterialApp(
          home: CounterScreen(),
        ),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
