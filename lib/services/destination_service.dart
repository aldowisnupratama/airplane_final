import 'package:airplane/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DestinationService {
  CollectionReference destinationRef =
      FirebaseFirestore.instance.collection("destination");

  Future<List<DestinationModel>> fetchDestination() async {
    try {
      QuerySnapshot result = await destinationRef.get();

      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
            e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
