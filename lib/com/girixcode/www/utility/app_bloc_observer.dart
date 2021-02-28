import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(Cubit cubit) {
    print("On Cubit Created");
    print(cubit);
  }

  @override
  void onClose(Cubit cubit) {
    print("On Cubit Closed");
    print(cubit);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print("On Cubit Error: ${error}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("On Bloc Transition ");
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print("On Cubit Change: $change");
  }

  @override
  void onEvent(Bloc bloc, Object event) {
    print("On Bloc Event");
  }
}
