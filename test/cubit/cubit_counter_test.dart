import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_counter_app/com/girixcode/www/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CounterCubit", () {
    CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });
    test(
        "The Initial State For The CounterCubit is CounterCubit(counterValue: 0)",
        () {
      expect(counterCubit.state, CounterState(counterValue: 0));
    });

    blocTest(
        "The Cubit should emit CounterState(counterValue: 1, wasIncremented: true) when increment() is Triggered.",
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: [CounterState(counterValue: 1, wasIncremented: true)]);

    blocTest(
        "The Cubit should emit CounterState(counterValue: -1, wasIncremented: false) when decrement() is Triggered.",
        build: () => counterCubit,
        act: (cubit) => cubit.decrement(),
        expect: [CounterState(counterValue: -1, wasIncremented: false)]);
  });
}
