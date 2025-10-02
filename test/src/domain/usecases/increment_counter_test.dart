// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:structured_counter_app/src/domain/repositories/counter_repository.dart';
// import 'package:structured_counter_app/src/domain/usecases/increment_counter.dart';

// import 'increment_counter_test.mocks.dart';

// @GenerateMocks([CounterRepository])
// void main() {
//   late IncrementCounter usecase;
//   late MockCounterRepository mockCounterRepository;

//   setUp(() {
//     mockCounterRepository = MockCounterRepository();
//     usecase = IncrementCounter(mockCounterRepository);
//   });

//   test('should call incrementCounter on the repository', () async {
//     // arrange
//     when(mockCounterRepository.incrementCounter()).thenAnswer((_) async => {});
//     // act
//     await usecase();
//     // assert
//     verify(mockCounterRepository.incrementCounter());
//     verifyNoMoreInteractions(mockCounterRepository);
//   });
// }
