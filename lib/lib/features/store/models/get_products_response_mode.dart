import 'package:json_annotation/json_annotation.dart';
part 'get_products_response_mode.g.dart';

@JsonSerializable()
class GetProductsResponseModel {
  final int? id;
  final String? name;
  final String? description;
  final String? image;
  final String? price;
  final int? stars;
  @JsonKey(name: 'is_favorite')
  final int? isFavorite;
  final int? userId;
  final User? user;

  GetProductsResponseModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.stars,
    this.isFavorite,
    this.userId,
    this.user,
  });

  factory GetProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseModelFromJson(json);
}

@JsonSerializable()
class User {
  final int? id;
  final String? name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
