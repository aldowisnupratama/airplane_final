import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/model.dart';

class TransactionService {
  CollectionReference transactionReference =
      FirebaseFirestore.instance.collection('transaction');

  Future<void> createTransaction(TransactionModel transactionModel) async {
    try {
      transactionReference.add({
        'destination': transactionModel.destinationModel!.toJson(),
        'amountOfTraveler': transactionModel.amountOfTraveler,
        'selectedSeats': transactionModel.selectedSeats,
        'insurance': transactionModel.insurance,
        'refundable': transactionModel.refundable,
        'vat': transactionModel.vat,
        'price': transactionModel.price,
        'grandTotal': transactionModel.grandTotal,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<List<TransactionModel>> fetchTransactions() async {
    try {
      QuerySnapshot result = await transactionReference.get();

      List<TransactionModel> transactions = result.docs.map(
        (e) {
          return TransactionModel.fromJson(
              e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return transactions;
    } catch (e) {
      throw e;
    }
  }
}
