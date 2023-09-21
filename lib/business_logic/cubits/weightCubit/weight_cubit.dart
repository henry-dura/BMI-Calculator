import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'weight_state.dart';

class WeightCubit extends Cubit<WeightState> {
  WeightCubit() : super(WeightState(weight: 40));

  void increase()=> emit(WeightState(weight:state.weight + 1));

  void decrease()=> emit(WeightState(weight:state.weight - 1));
}
