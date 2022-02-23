import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test_1/constant/enums.dart';
import 'package:bloc_test_1/cubit/internet_cubit.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterInitial> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubscription;
  CounterCubit({@required this.internetCubit})
      : super(CounterInitial(counter: 0)) {
    internetStreamSubscription = internetCubit.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(CounterInitial(counter: state.counter + 1));
  void decrement() => emit(CounterInitial(counter: state.counter - 1));
  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
