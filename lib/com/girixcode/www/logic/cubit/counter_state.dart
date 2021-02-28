part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncremented;

  @override
  // TODO: implement props
  List<Object> get props => [this.counterValue, this.wasIncremented];

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  CounterState({
    @required this.counterValue,
    @required this.wasIncremented,
  });

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return new CounterState(
      counterValue: map['counterValue'] as int,
      wasIncremented: map['wasIncremented'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'counterValue': this.counterValue,
      'wasIncremented': this.wasIncremented,
    } as Map<String, dynamic>;
  }

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return 'CounterState{counterValue: $counterValue, wasIncremented: $wasIncremented}';
  }
}
