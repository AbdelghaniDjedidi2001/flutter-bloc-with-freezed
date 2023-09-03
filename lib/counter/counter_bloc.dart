import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_event.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterEvent>((event, emit) {
      event.map(
        increment: (_) => emit(state.copyWith(count: state.count + 1)),
        decrement: (_) => emit(state.copyWith(count: state.count - 1)),
        reset: (_) => emit(const CounterState(count: 0)),
      );
    });
  }
}