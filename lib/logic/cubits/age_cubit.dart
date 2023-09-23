import 'package:bloc/bloc.dart';

class AgeCubit extends Cubit<int> {
  AgeCubit() : super(18);

  void increase()=> emit(state + 1);

  void decrease()=> emit(state - 1);
}
