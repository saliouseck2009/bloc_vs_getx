part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {
  int counter;
  String message;
  CounterInitial({this.counter, this.message});
}
