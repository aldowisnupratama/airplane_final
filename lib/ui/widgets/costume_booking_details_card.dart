import 'package:airplane/shared/shared.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/model.dart';

import '../ui.dart';

class CostumeBookingDetailsCard extends StatelessWidget {
  final TransactionModel transactionModel;
  const CostumeBookingDetailsCard({Key? key, required this.transactionModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            destinationName: transactionModel.destinationModel!.name.toString(),
            destinationLocation: transactionModel.destinationModel!.city,
            rate: transactionModel.destinationModel!.rating.toString(),
          ),
          SizedBox(
            height: SizeConfig.blockVertical(2),
          ),
          Text("Booking Details",
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16)),
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
            itemDetails: "${(transactionModel.vat! * 100).toStringAsFixed(0)}%",
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
}
