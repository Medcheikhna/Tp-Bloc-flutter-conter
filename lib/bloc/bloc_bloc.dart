import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  int counter = 0;
  BlocBloc() : super(BlocInitial()) {
    on<BlocEvent>((event, emit) {
      if (event is IncrementEvent) {
        counter = counter + 1;
        emit(CounterValueChangedState(counter: counter));
      } else if (event is DecrementEvent) {
        counter = counter - 1;
        emit(CounterValueChangedState(counter: counter));
      } else {
        counter = 0;
        emit(CounterValueChangedState(counter: counter));
      }
    });
  }
}
