import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'height_state.dart';

class HeightCubit extends Cubit<HeightState> {
  HeightCubit() : super(HeightState(height:110));

  void currentHeight(int currentHeight)=> emit(HeightState(height: currentHeight));
}
