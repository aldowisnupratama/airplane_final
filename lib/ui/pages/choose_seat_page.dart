import 'package:airplane/cubit/cubit.dart';
import 'package:airplane/models/model.dart';
import 'package:airplane/shared/shared.dart';
import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeatPage({Key? key, required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
          margin: EdgeInsets.only(top: SizeConfig.blockVertical(5)),
          child: Text(
            "Select Your\nFavorite Seat",
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
          ));
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical(3)),
        child: Row(
          children: [
            //note available
            Container(
              width: SizeConfig.blockHorizontal(4),
              height: SizeConfig.blockVertical(2),
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal(1),
                  left: SizeConfig.blockHorizontal(3)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/icon_available.png"))),
            ),

            Text(
              "Available",
              style: blackTextStyle,
            ),
            Container(
              width: SizeConfig.blockHorizontal(4),
              height: SizeConfig.blockVertical(2),
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal(1),
                  left: SizeConfig.blockHorizontal(3)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/icon_selected.png"))),
            ),

            Text(
              "Selected",
              style: blackTextStyle,
            ),
            Container(
              width: SizeConfig.blockHorizontal(4),
              height: SizeConfig.blockVertical(2),
              margin: EdgeInsets.only(
                  right: SizeConfig.blockHorizontal(1),
                  left: SizeConfig.blockHorizontal(3)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/icon_unavailable.png"))),
            ),

            Text(
              "Unavailable",
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(3.5)),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockHorizontal(6),
                vertical: SizeConfig.blockVertical(3)),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                          child: Center(
                        child: Text(
                          "A",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Center(
                        child: Text(
                          "B",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Center(
                        child: Text(
                          "",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Center(
                        child: Text(
                          "C",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                    ),
                    Expanded(
                      child: Container(
                          child: Center(
                        child: Text(
                          "D",
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      )),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: "A1",
                        status: 2,
                      ),
                      SeatItem(
                        id: "B1",
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "1",
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: "C1",
                        status: 0,
                      ),
                      SeatItem(
                        id: "D1",
                        status: 2,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: "A2",
                        status: 2,
                      ),
                      SeatItem(
                        id: "B2",
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "2",
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: "C2",
                        status: 0,
                      ),
                      SeatItem(
                        id: "D2",
                        status: 2,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: "A3",
                        status: 2,
                      ),
                      SeatItem(
                        id: "B3",
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "3",
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: "C3",
                        status: 0,
                      ),
                      SeatItem(
                        id: "D3",
                        status: 2,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: "A4",
                        status: 2,
                      ),
                      SeatItem(
                        id: "B4",
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "4",
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: "C4",
                        status: 0,
                      ),
                      SeatItem(
                        id: "D4",
                        status: 2,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: "A5",
                        status: 2,
                      ),
                      SeatItem(
                        id: "B5",
                        status: 2,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "5",
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: "C5",
                        status: 0,
                      ),
                      SeatItem(
                        id: "D5",
                        status: 2,
                      )
                    ],
                  ),
                ),

                //seat choosen
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(4)),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Your seat",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )),
                      Expanded(
                        child: Text(
                          state.join(", "),
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockVertical(2),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Total",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      )),
                      Expanded(
                        child: Text(
                          NumberFormat.currency(
                                  locale: "id",
                                  symbol: "IDR ",
                                  decimalDigits: 0)
                              .format(state.length * destination.price),
                          style: purpleTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            child: CostumeButton(
                buttonName: "Continue to Checkout",
                onPressed: () {
                  int priced = (destination.price * state.length).toInt();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutPage(
                                  transactionModel: TransactionModel(
                                destinationModel: destination,
                                amountOfTraveler: state.length,
                                selectedSeats: state.join(", "),
                                insurance: true,
                                vat: 0.45,
                                refundable: false,
                                price: priced,
                                grandTotal: priced + (priced * 0.45).toInt(),
                              ))));
                },
                width: SizeConfig.blockHorizontal(40),
                marginTop: SizeConfig.blockVertical(3.5),
                marginBottom: SizeConfig.blockVertical(10)),
          );
        },
      );
    }

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [title(), seatStatus(), selectSeat(), checkoutButton()],
      ),
    );
  }
}
