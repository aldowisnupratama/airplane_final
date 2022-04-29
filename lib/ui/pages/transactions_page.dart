import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is TransactionSuccess) {
            if (state.transactions.length == 0) {
              return Center(
                child: Text(
                  "You have'nt making any transactions yet.",
                  style: purpleTextStyle.copyWith(
                      fontSize: 23, fontWeight: semiBold),
                ),
              );
            } else {
              return Container(
                margin:
                    EdgeInsets.only(top: 20, left: 24, right: 24, bottom: 100),
                child: ListView.builder(
                    itemCount: state.transactions.length,
                    itemBuilder: (context, index) {
                      return CostumeBookingDetailsCard(
                        transactionModel: state.transactions[index],
                      );
                    }),
              );
            }
          }
          return Center(
            child: Text("Transaction page"),
          );
        },
      ),
    );
  }
}
