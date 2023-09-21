import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(AgeState(age: 18));

  void increase()=> emit(AgeState(age: state.age + 1));

  void decrease()=> emit(AgeState(age: state.age - 1));
}
