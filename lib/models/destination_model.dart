import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String imageUrl;
  final String about;
  final int price;
  final double rating;

  DestinationModel(
      {required this.id,
      required this.name,
      required this.city,
      required this.imageUrl,
      required this.about,
      required this.price,
      required this.rating});

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
        id: id,
        name: json["name"].toString(),
        city: json["city"].toString(),
        imageUrl: json["imageUrl"].toString(),
        about: json["about"].toString(),
        price: json["price"],
        rating: json["rating"]);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'city': city,
        'imageUrl': imageUrl,
        'about': about,
        'price': price,
        'rating': rating,
      };

  @override
  List<Object?> get props => [name, city, imageUrl, about, price, rating];
}
