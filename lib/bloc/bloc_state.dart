part of 'bloc_bloc.dart';

@immutable
abstract class BlocState {}

class BlocInitial extends BlocState {}

class CounterValueChangedState extends BlocState {
  final int counter;

  CounterValueChangedState({required this.counter});
}


