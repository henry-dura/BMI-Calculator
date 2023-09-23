import 'package:bloc/bloc.dart';

class HeightCubit extends Cubit<int> {
  HeightCubit() : super(110);

  void currentHeight(int currentHeight)=> emit(currentHeight);
}
