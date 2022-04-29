import 'package:airplane/models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(errorMessage: e.toString()));
    }
  }

  void fetchTransactions() async {
    try {
      emit(TransactionLoading());
      print("loading");

      List<TransactionModel> transactions =
          await TransactionService().fetchTransactions();

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(errorMessage: e.toString()));
    }
  }
}
