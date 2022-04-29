import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void selectSeat(String id) {
    if (!isSelected(id)) {
      state.add(id);
      print(state);
    } else {
      state.remove(id);
    }
    print(state);
    emit(List.from(state));
  }

  bool isSelected(String id) {
    if (state.indexOf(id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
