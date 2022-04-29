import 'package:airplane/cubit/cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/utils.dart';
import '../../ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transactionModel;
  const CheckoutPage({Key? key, required this.transactionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockHorizontal(12)),
        child: Column(
          children: [
            Container(
              width: SizeConfig.blockHorizontal(80),
              height: SizeConfig.blockVertical(8),
              margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(1)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/image_checkout.png"))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                    ),
                    Text(
                      "Tangerang",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 24),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical(2.5)),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockHorizontal(5),
            vertical: SizeConfig.blockVertical(3.5)),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationBookingDetails(
              imageURL: transactionModel.destinationModel!.imageUrl.toString(),
              destinationName:
                  transactionModel.destinationModel!.name.toString(),
              destinationLocation: transactionModel.destinationModel!.city,
              rate: transactionModel.destinationModel!.rating.toString(),
            ),
            SizedBox(
              height: SizeConfig.blockVertical(2),
            ),
            Text("Booking Details",
                style: blackTextStyle.copyWith(
                    fontWeight: semiBold, fontSize: 16)),
            CostumeBookingDetailsTile(
              itemName: "Treveler",
              itemDetails:
                  "${transactionModel.amountOfTraveler.toString()} person",
              color: kBlackColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "Seat",
              itemDetails: transactionModel.selectedSeats!,
              color: kBlackColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "Insurance",
              itemDetails: transactionModel.insurance.toString(),
              color: kGreenColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "Refundable",
              itemDetails: transactionModel.refundable.toString(),
              color: kRedColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "VAT",
              itemDetails:
                  "${(transactionModel.vat! * 100).toStringAsFixed(0)}%",
              color: kBlackColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "Price",
              itemDetails:
                  "${NumberFormat.currency(locale: "id", symbol: "IDR ", decimalDigits: 0).format(transactionModel.price)}",
              color: kBlackColor,
            ),
            CostumeBookingDetailsTile(
              itemName: "Grand Total",
              itemDetails:
                  "${NumberFormat.currency(locale: "id", symbol: "IDR ", decimalDigits: 0).format(transactionModel.grandTotal)}",
              color: kBlackColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(3.2)),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockHorizontal(6),
                  vertical: SizeConfig.blockVertical(3)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18), color: kWhiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Payment Details",
                      style: blackTextStyle.copyWith(
                          fontWeight: semiBold, fontSize: 16),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
                    child: Row(
                      children: [
                        Container(
                          width: SizeConfig.blockHorizontal(25),
                          height: SizeConfig.blockVertical(8),
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(18)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(
                                    right: SizeConfig.blockHorizontal(1)),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/icons/logo.png"))),
                              ),
                              Container(
                                child: Text(
                                  "Pay",
                                  style: whiteTextStyle.copyWith(
                                      fontWeight: medium, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: SizeConfig.blockHorizontal(4)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${NumberFormat.currency(locale: "id", symbol: "IDR ", decimalDigits: 0).format(state.userModel.balance)}",
                                style: blackTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 16,
                                ),
                                softWrap: true,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Current Balance",
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return Container(
            margin: EdgeInsets.only(top: SizeConfig.blockVertical(3.2)),
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockHorizontal(6),
                vertical: SizeConfig.blockVertical(3)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: kWhiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
                  child: Row(
                    children: [
                      Container(
                        width: SizeConfig.blockHorizontal(25),
                        height: SizeConfig.blockVertical(8),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(18)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(
                                  right: SizeConfig.blockHorizontal(1)),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/icons/logo.png"))),
                            ),
                            Container(
                              child: Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.blockHorizontal(4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${NumberFormat.currency(locale: "id", symbol: "IDR ", decimalDigits: 0).format(2323)}",
                              style: blackTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 16,
                              ),
                              softWrap: true,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Current Balance",
                              style: greyTextStyle.copyWith(fontWeight: light),
                            )
                          ],
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

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, succesCheckoutPage, (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${state.errorMessage}"),
              backgroundColor: kRedColor,
            ));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            margin: EdgeInsets.only(
              top: SizeConfig.blockVertical(3),
            ),
            child: Column(
              children: [
                CostumeButton(
                  buttonName: "Pay Now",
                  onPressed: () {
                    context
                        .read<TransactionCubit>()
                        .createTransaction(transactionModel);
                  },
                  width: SizeConfig.blockHorizontal(89),
                  marginBottom: SizeConfig.blockVertical(3.5),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Terms and Conditions",
                    style: greyTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockVertical(3),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton()
          ],
        ),
      ),
    );
  }
}
