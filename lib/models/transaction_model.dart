import 'package:airplane/models/model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  String? id;
  DestinationModel? destinationModel;
  int? amountOfTraveler;
  String? selectedSeats;
  bool? insurance;
  bool? refundable;
  double? vat;
  int? price;
  int? grandTotal;

  TransactionModel(
      {this.id,
      this.destinationModel,
      this.amountOfTraveler,
      this.selectedSeats,
      this.insurance,
      this.refundable,
      this.vat,
      this.price,
      this.grandTotal});

  TransactionModel.fromJson(String id, Map<String, dynamic> json) {
    id = id;
    print(id);
    destinationModel = DestinationModel.fromJson(
        json['destination']['id'], json['destination']);
    print(destinationModel!.city);
    amountOfTraveler = json['amountOfTravaler'];
    print(amountOfTraveler);
    selectedSeats = json['selectedSeats'];
    print(selectedSeats);
    insurance = json['insurance'];
    print(insurance);
    refundable = json['refundable'];
    print(refundable);
    vat = json['vat'];
    print(vat);
    price = json['price'];
    print(price);
    grandTotal = json['grandTotal'];
    print(grandTotal);
  }

  @override
  List<Object?> get props => [
        this.destinationModel,
        this.amountOfTraveler,
        this.selectedSeats,
        this.insurance,
        this.refundable,
        this.vat,
        this.price,
        this.grandTotal
      ];
}
