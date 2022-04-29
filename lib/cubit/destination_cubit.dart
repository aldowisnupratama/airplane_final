import 'package:airplane/cubit/cubit.dart';
import 'package:airplane/models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../services/service.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestination() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fetchDestination();
      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
