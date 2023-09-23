import 'package:bloc/bloc.dart';


class WeightCubit extends Cubit<int> {
  WeightCubit() : super(40);

  void increase()=> emit(state + 1);

  void decrease()=> emit(state - 1);
}
